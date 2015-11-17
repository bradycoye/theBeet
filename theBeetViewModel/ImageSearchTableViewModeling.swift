import ReactiveCocoa

public protocol ImageSearchTableViewModeling {
    var cellModels: AnyProperty<[ImageSearchTableViewCellModeling]> { get }
    func startSearch()
}