import ReactiveCocoa
import Result
import Himotoki
import TwitterKit

public final class ImageSearch: ImageSearching {
    private let network: Networking
    
    public init(network: Networking) {
        self.network = network
    }
    
    public func searchImages() -> SignalProducer<ResponseEntity, NetworkError> {
        let url = Pixabay.apiURL
        let parameters = Pixabay.requestParameters
        return network.requestJSON(url, parameters: parameters)
            .attemptMap { json in
                if let response = (try? decode(json)) as ResponseEntity? {
                    
                    return Result(value: response)
                }
                else {
                    return Result(error: .IncorrectDataReturned)
                }
        }
    }
    
    public func searchTwitter() -> SignalProducer<TwitterResponseEntity, NetworkError> {
        let url = TwitterAPI.apiURL
        let parameters = TwitterAPI.requestParameters
        
        return network.requestTrends(url, parameters: parameters)
            .attemptMap { json in
                if let response = (try? decode(json)) as TwitterResponseEntity? {
                    print(response)
                    print("I executed")
                    return Result(value: response)
                }
                else {
                    print("I Executed fail")
                    return Result(error: .IncorrectDataReturned)
                }
        }
        
        
    }
    
    

}

