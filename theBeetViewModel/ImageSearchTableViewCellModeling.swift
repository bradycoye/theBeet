import ReactiveCocoa

public protocol ImageSearchTableViewCellModeling {
    var id: UInt64 { get }
    var pageImageSizeText: String { get }
    var tagText: String { get }
    
    func getPreviewImage() -> SignalProducer<UIImage?, NoError>
}