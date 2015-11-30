import ReactiveCocoa

public protocol ImageSearchTableViewCellModeling {
    var id: UInt64 { get }
    var pageImageSizeText: String { get }
    var tagText: String { get }
    
    var name: String { get }
    var query: String { get }
    
    func getPreviewImage() -> SignalProducer<UIImage?, NoError>
}