import RxCocoa
import RxSwift
import Foundation

final class HomeViewModel {
    
    private var networker = HomeNetworkManager.shared
    private let _shows = BehaviorSubject<[Show]>(value: [])
    
    init() {
        self.fetchShows()
    }
    
    func fetchShows() {
        _shows.onNext([Show]())
        networker.getShowData(id: "0") {[weak self] (result) in
            switch result {
            case .success(let returnedShows):
                self?._shows.onNext(returnedShows)
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }

    
}
