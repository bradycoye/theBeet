import ReactiveCocoa
import Alamofire
import TwitterKit

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
    
    
    
    public func requestTrends(url: String, parameters: [String : AnyObject]?) -> SignalProducer<AnyObject, NetworkError>
    {
        return SignalProducer { observer, disposable in
            if let userID = Twitter.sharedInstance().sessionStore.session()!.userID {
                let client = TWTRAPIClient(userID: userID)
                var error: NSError?
                // make requests with client
                
                let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod("GET", URL: url, parameters: parameters, error: &error)
                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                    if (connectionError == nil) {
                        var jsonError : NSError?
                        let json : AnyObject? = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers )
                        observer.sendNext(json!)
                        observer.sendCompleted()
                    }
                    else {
                        print("Error: \(connectionError)")
                        observer.sendFailed(NetworkError(error: error!))
                    }
                }
                
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
