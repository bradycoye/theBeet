import ReactiveCocoa
import Alamofire

public final class Network: Networking {
    private let queue = dispatch_queue_create(
        "SwinjectMMVMExample.ExampleModel.Network.Queue",
        DISPATCH_QUEUE_SERIAL)
    
    public init() { }
    
    public func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NetworkError>
    {
        return SignalProducer { observer, disposable in
            Alamofire.request(.GET, url, parameters: parameters)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let value):
                        sendNext(observer, value)
                        sendCompleted(observer)
                    case .Failure(let error):
                        sendError(observer, NetworkError(error: error))
                    }
                }
            }
    }
}
