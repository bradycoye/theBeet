import ReactiveCocoa

public protocol ImageSearchTableViewModeling {
    var cellModels: AnyProperty<[TwitterSearchTableViewCellModeling]> { get }
    //func startSearch()
    func startTrendSearch()
}