import ReactiveCocoa
//import TwitterKit

public protocol Networking {
    func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NetworkError>
    
    func requestImage(url: String) -> SignalProducer<UIImage, NetworkError>
    
    func requestTrends(url: String, parameters: [String : AnyObject]?) -> SignalProducer<AnyObject, NetworkError>
}
