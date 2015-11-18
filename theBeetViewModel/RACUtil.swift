import Foundation
import ReactiveCocoa

internal extension NSObject {
    internal var racutil_willDeallocProducer: SignalProducer<(), NoError>  {
        return self.rac_willDeallocSignal()
            .toSignalProducer()
            .map { _ in }
            .flatMapError { _ in SignalProducer(value: ()) }
    }
}
