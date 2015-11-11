import ReactiveCocoa

public protocol ImageSearchTableViewModeling {
    var cellModels: PropertyOf<[ImageSearchTableViewCellModeling]> { get }
    func startSearch()
}