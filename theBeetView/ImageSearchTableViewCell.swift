import UIKit
import theBeetViewModel
import ReactiveCocoa

internal final class ImageSearchTableViewCell: UITableViewCell {
    internal var viewModel: TwitterSearchTableViewCellModeling? {
        didSet {
            tagLabel.text = viewModel?.name
            print(viewModel?.name.isEmpty)
            imageSizeLabel.text = viewModel?.query
            
        }
    }

    
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var imageSizeLabel: UILabel!
}