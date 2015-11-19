import UIKit
import theBeetViewModel
import TwitterKit

public final class ImageSearchTableViewController: UITableViewController {
    private var autoSearchStarted = false
    
    public var viewModel: ImageSearchTableViewModeling? {
        didSet {
            if let viewModel = viewModel {
                viewModel.cellModels.producer
                    .on(next: { _ in self.tableView.reloadData() })
                    .start()
            }
        }
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if !autoSearchStarted {
            autoSearchStarted = true
            viewModel?.startSearch()
        }
    }
    
    public override func viewDidLoad() {
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

    }

    
}

// MARK: UITableViewDataSource
extension ImageSearchTableViewController {
    public override func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        if let viewModel = viewModel {
            return viewModel.cellModels.value.count
        }
        return 0
    }
    
    public override func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ImageSearchTableViewCell",
            forIndexPath: indexPath) as! ImageSearchTableViewCell
        if let viewModel = viewModel {
            cell.viewModel = viewModel.cellModels.value[indexPath.row]
        }
        else {
            cell.viewModel = nil
        }
        
        return cell
    }
}