import ReactiveCocoa

public protocol ImageSearching {
    func searchImages() -> SignalProducer<ResponseEntity, NetworkError>
    
    func searchTwitter() -> SignalProducer<ResponseEntity, NetworkError>

}