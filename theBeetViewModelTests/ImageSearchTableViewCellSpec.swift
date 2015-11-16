import Quick
import Nimble
@testable import theBeetModel
@testable import theBeetViewModel

class ImageSearchTableViewCellModelSpec: QuickSpec {
    override func spec() {
        it("sets id.") {
            let viewModel = ImageSearchTableViewCellModel(image: dummyResponse.images[0])
            
            expect(viewModel.id).toEventually(equal(10000))
        }
        it("formats tag and page image size texts.") {
            let viewModel = ImageSearchTableViewCellModel(image: dummyResponse.images[0])
            
            expect(viewModel.pageImageSizeText).toEventually(equal("1000 x 2000"))
            expect(viewModel.tagText).toEventually(equal("a, b"))
        }
    }
}