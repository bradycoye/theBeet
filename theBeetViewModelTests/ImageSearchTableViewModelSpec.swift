import Quick
import Nimble
import ReactiveCocoa
@testable import theBeetModel
@testable import theBeetViewModel

class ImageSearchTableViewModelSpec: QuickSpec {
    // MARK: Stub
    class StubImageSearch: ImageSearching {
        func searchImages() -> SignalProducer<ResponseEntity, NetworkError> {
            return SignalProducer { observer, disposable in
                observer.sendNext(dummyResponse)
                observer.sendCompleted()
                }
                .observeOn(QueueScheduler())
        }
    }
    
    // MARK: Spec
    override func spec() {
        var viewModel: ImageSearchTableViewModel!
        beforeEach {
            viewModel = ImageSearchTableViewModel(imageSearch: StubImageSearch())
        }
        
        it("eventually sets cellModels property after the search.") {
            var cellModels: [ImageSearchTableViewCellModeling]? = nil
            viewModel.cellModels.producer
                .on(next: { cellModels = $0 })
                .start()
            viewModel.startSearch()
            
            expect(cellModels).toEventuallyNot(beNil())
            expect(cellModels?.count).toEventually(equal(2))
            expect(cellModels?[0].id).toEventually(equal(10000))
            expect(cellModels?[1].id).toEventually(equal(10001))
        }
        it("sets cellModels property on the main thread.") {
            var onMainThread = false
            viewModel.cellModels.producer
                .on(next: { _ in onMainThread = NSThread.isMainThread() })
                .start()
            viewModel.startSearch()
            
            expect(onMainThread).toEventually(beTrue())
        }
    }
}