import Foundation

protocol ShowsAPIServices {
    associatedtype APIdata
    func getShowData(id: String, completion: @escaping (Result<APIdata, Error>) -> (Void))
}

protocol ShowsInfoAPIService {
   // переделать под kingfisher
   func getShowBackgroundImages(id: String, completion: @escaping (Result<[ImagesShowElement], Error>) -> (Void))
    func getShowCast(id: String, completion: @escaping (Result<[Actor], Error>) -> (Void))
}


