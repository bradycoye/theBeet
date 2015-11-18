import ReactiveCocoa
import Alamofire

public final class Network: Networking {
    private let queue = dispatch_queue_create(
        "theBeet.theBeetModel.Network.Queue",
        DISPATCH_QUEUE_SERIAL)
    
    public init() { }
    
    public func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NetworkError>
    {
        return SignalProducer { observer, disposable in
            let serializer = Alamofire.Request.JSONResponseSerializer()
            Alamofire.request(.GET, url, parameters: parameters)
                .responseJSON { response  in
                    switch response.result {
                    case .Success(let value):
                        observer.sendNext(value)
                        observer.sendCompleted()
                    case .Failure:
                        observer.sendFailed(NetworkError(error: response.result.error!))
                    }
                }
                .responseJSON { response in
                    // debugPrint(response)
            }
        }
    }
    
    public func requestImage(url: String) -> SignalProducer<UIImage, NetworkError> {
        return SignalProducer { observer, disposable in
            let serializer = Alamofire.Request.dataResponseSerializer()
            Alamofire.request(.GET, url)
                .responseData { response  in
                    switch response.result {
                    case .Success(let data):
                        guard let image = UIImage(data: data) else {
                            observer.sendFailed(.IncorrectDataReturned)
                            print("this shit failed")
                            return
                        }
                        print("this shit should be working")
                        observer.sendNext(image)
                        observer.sendCompleted()
                    case .Failure(let error):
                        observer.sendFailed(NetworkError(error: error))
                        
                    }
            }
        }
    }
}
