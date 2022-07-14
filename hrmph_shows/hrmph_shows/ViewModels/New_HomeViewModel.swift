import RxCocoa
import RxSwift
import Foundation

final class HomeViewModel {
    
    private var networker = HomeNetworkManager.shared
    private let _shows = BehaviorRelay<[Show]>(value: [])
    private let _tonightShows = BehaviorRelay<[Show]>(value: [])
    init() {
        self.fetchTopShows()
        self.fetchTonightShows()
    }
    
    func fetchTopShows() {
        _shows.accept([Show]())
        networker.getShowData(id: "") {[weak self] (result) in
            switch result {
            case .success(let returnedShows):
                self?._shows.accept(returnedShows.shuffled())
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func fetchTonightShows() {
        _tonightShows.accept([Show]())
        networker.getShowData(id: "?page=1") {[weak self] (result) in
            switch result {
            case .success(let returnedTonightShows):
                self?._tonightShows.accept(returnedTonightShows.shuffled())
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    var shows: Driver<[Show]> {
        return _shows.asDriver()
    }
    
    
    var tonightShows: Driver<[Show]> {
        return _tonightShows.asDriver()
    }
    var numberOfTonigtShows: Int {
        return _tonightShows.value.count
    }
    
    var numberOfShows: Int {
        return _shows.value.count
    }
    
    func showViewModelForIndex(index: Int) -> ShowViewModel? {
        guard index < _shows.value.count else { return nil }
        return ShowViewModel(show: _shows.value[index])
    }
    func tonightShowViewModelFor(index: Int) -> ShowViewModel? {
        guard index < _tonightShows.value.count else { return nil }
        return ShowViewModel(show: _tonightShows.value[index])
    }
    
}
