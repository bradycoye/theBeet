import UIKit
import Swinject
import theBeetModel
import theBeetViewModel
import theBeetView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var container: Container {
        let container = Container()
        
        // Models
        container.register(Networking.self) { _ in Network() }
        container.register(ImageSearching.self) { r in
            ImageSearch(network: r.resolve(Networking.self)!)
        }
        
        // View models
        container.register(ImageSearchTableViewModeling.self) { r
            in ImageSearchTableViewModel(imageSearch: r.resolve(ImageSearching.self)!)
        }
        
        // Views
        container.registerForStoryboard(ImageSearchTableViewController.self) {
            r, c in
            c.viewModel = r.resolve(ImageSearchTableViewModeling.self)!
        }
        
        return container
    }
    
    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        self.window = window
        
        let bundle = NSBundle(forClass: ImageSearchTableViewController.self)
        let storyboard = SwinjectStoryboard.create(
            name: "main",
            bundle: bundle,
            container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }
    // Omitted...
}