import ReactiveCocoa
import theBeetModel

public final class TwitterSearchTableViewCellModel
    : NSObject, TwitterSearchTableViewCellModeling
{
    
    public let name: String
    public let query: String
    private let network: Networking
    
    internal init(trends: TrendEntity, network: Networking) {
        name = trends.name
        query = trends.query
        
        self.network = network
        
        
        super.init()
    }
    
    
}