import ReactiveCocoa

public protocol ImageSearching {
    func searchImages() -> SignalProducer<ResponseEntity, NetworkError>
    
    func searchTwittter() -> SignalProducer<ResponseEntity, NetworkError>
}