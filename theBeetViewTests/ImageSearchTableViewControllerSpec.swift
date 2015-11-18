import Quick
import Nimble
import ReactiveCocoa
import theBeetViewModel
@testable import theBeetView

class ImageSearchTableViewControllerSpec: QuickSpec {
    // MARK: Mock
    class MockViewModel: ImageSearchTableViewModeling {
        let cellModels = AnyProperty(
            MutableProperty<[ImageSearchTableViewCellModeling]>([]))
        var startSearchCallCount = 0
        
        func startSearch() {
            startSearchCallCount++
        }
    }
    
    // MARK: Spec
    override func spec() {
        it("starts searching images when the view is about to appear at the first time.") {
            let viewModel = MockViewModel()
            let storyboard = UIStoryboard(
                name: "main",
                bundle: NSBundle(forClass: ImageSearchTableViewController.self))
            let viewController = storyboard.instantiateViewControllerWithIdentifier(
                "ImageSearchTableViewController")
                as! ImageSearchTableViewController
            viewController.viewModel = viewModel
            
            expect(viewModel.startSearchCallCount) == 0
            viewController.viewWillAppear(true)
            expect(viewModel.startSearchCallCount) == 1
            viewController.viewWillAppear(true)
            expect(viewModel.startSearchCallCount) == 1
        }
    }
}