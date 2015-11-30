/*
import UIKit
import Swinject
import theBeetModel
import theBeetViewModel
import theBeetView


extension SwinjectStoryboard {
    
    class var container: Container {
        let container = Container()
        
        // Models
        container.register(Networking.self) { _ in Network() }
        container.register(ImageSearching.self) { r in
            ImageSearch(network: r.resolve(Networking.self)!)
            
        }
        
        // View models
        container.register(ImageSearchTableViewModeling.self) { r in
            ImageSearchTableViewModel(
                imageSearch: r.resolve(ImageSearching.self)!,
                network: r.resolve(Networking.self)!)
        }
        
        // Views
        container.registerForStoryboard(ImageSearchTableViewController.self) { r, c in
            c.viewModel = r.resolve(ImageSearchTableViewModeling.self)!
        }
        
        
        container.registerForStoryboard(ConnectAccountsViewController.self) { r, c in
            
        }
        
        
        
        return container
    }
    
    
}
*/