import ReactiveCocoa

public protocol Networking {
    func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NetworkError>
}
