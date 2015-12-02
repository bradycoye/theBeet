import ReactiveCocoa
import theBeetModel

public final class ImageSearchTableViewModel: ImageSearchTableViewModeling {
    public var cellModels: AnyProperty<[TwitterSearchTableViewCellModeling]> {
        return AnyProperty(_cellModels)
    }
    private let _cellModels = MutableProperty<[TwitterSearchTableViewCellModeling]>([])
    //private let _twittercellModels = MutableProperty<[ImageSearchTableViewCellModeling]>([])
    private let imageSearch: ImageSearching
    private let network: Networking
    
    public init(imageSearch: ImageSearching, network: Networking) {
        self.imageSearch = imageSearch
        self.network = network
    }
    /*
    public func startSearch() {
        imageSearch.searchImages()
            .map { response in
                response.images.map {
                    
                    ImageSearchTableViewCellModel(image: $0, network: self.network)
                        as ImageSearchTableViewCellModeling
            
                }
            }
            .observeOn(UIScheduler())
            .on(next: { cellModels in
                self._cellModels.value = cellModels
            })
            .start()
        
        imageSearch.searchTwitter()
            .map { response in
                response.trends.map {
                    TwitterSearchTableViewCellModel(trends: $0, network: self.network)
                        as TwitterSearchTableViewCellModeling
                }
            }
            .observeOn(UIScheduler())
            .on(next: { cellModels in
                self._cellModels.value = cellModels
            })
            .start()
        
    }
    */
    public func startTrendSearch() {
       
        imageSearch.searchTwitter()
            .map { response in
                response.trends.map {
                    TwitterSearchTableViewCellModel(trends: $0, network: self.network)
                        as TwitterSearchTableViewCellModeling
                }
            }
            .observeOn(UIScheduler())
            .on(next: { cellModels in
                self._cellModels.value = cellModels
            })
            .start()
    }
    

}