import ReactiveCocoa
import theBeetModel

public final class ImageSearchTableViewModel: ImageSearchTableViewModeling {
    public var cellModels: PropertyOf<[ImageSearchTableViewCellModeling]> {
        return PropertyOf(_cellModels)
    }
    private let _cellModels = MutableProperty<[ImageSearchTableViewCellModeling]>([])
    private let imageSearch: ImageSearching
    
    public init(imageSearch: ImageSearching) {
        self.imageSearch = imageSearch
    }
    
    public func startSearch() {
        imageSearch.searchImages()
            .map { response in
                response.images.map {
                    ImageSearchTableViewCellModel(image: $0)
                        as ImageSearchTableViewCellModeling
                }
            }
            .observeOn(UIScheduler())
            .on(next: { cellModels in
                self._cellModels.value = cellModels
            })
            .start()
    }
}