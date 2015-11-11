import Quick
import Nimble
import Swinject
import theBeetModel
import theBeetViewModel
import theBeetView
@testable import theBeet

class AppDelegateSpec: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = AppDelegate().container
        }
        
        describe("Container") {
            it("resolves every service type.") {
                // Models
                expect(container.resolve(Networking.self)).notTo(beNil())
                expect(container.resolve(ImageSearching.self)).notTo(beNil())
                
                // ViewModels
                expect(container.resolve(ImageSearchTableViewModeling.self))
                    .notTo(beNil())
            }
            it("injects view models to views.") {
                let bundle = NSBundle(forClass: ImageSearchTableViewController.self)
                let storyboard = SwinjectStoryboard.create(
                    name: "main",
                    bundle: bundle,
                    container: container)
                let imageSearchTableViewController = storyboard
                    .instantiateViewControllerWithIdentifier("ImageSearchTableViewController")
                    as! ImageSearchTableViewController
                
                expect(imageSearchTableViewController.viewModel).notTo(beNil())
            }
        }
    }
}