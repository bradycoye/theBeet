import ReactiveCocoa

public protocol TwitterSearchTableViewCellModeling {
    
    var name: String { get }
    var query: String { get }
    
    //func getPreviewImage() -> SignalProducer<UIImage?, NoError>
}