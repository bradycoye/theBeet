import UIKit
import ReactiveCocoa

internal extension UITableViewCell {
    internal var racutil_prepareForReuseProducer: SignalProducer<(), NoError>  {
        return self.rac_prepareForReuseSignal
            .toSignalProducer()
            .map { _ in }
            .flatMapError { _ in SignalProducer(value: ()) }
    }
}
