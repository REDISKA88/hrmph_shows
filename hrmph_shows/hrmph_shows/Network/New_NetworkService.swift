import Foundation

protocol ShowsAPIServices {
    associatedtype APIdata
    func getShowData(id: String, completion: @escaping (Result<APIdata, Error>) -> (Void))
}

final class HomeNetworkManager: ShowsAPIServices {
    
    typealias APIdata = [Show]
    public static let shared = HomeNetworkManager()
    
    private var dataTask: URLSessionDataTask?
    private var baseUrl = "https://api.tvmaze.com/shows"
    
    func getShowData(id: String, completion: @escaping (Result<[Show], Error>) -> (Void)) {
        
        let popularShowsUrl = baseUrl + id
        guard let url = URL(string: popularShowsUrl) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("EMPTY DATA")
                return
            }
            print("Response status: \(response.statusCode)")
            
            do {
                let decoder = JSONDecoder()
                let JSONData = try decoder.decode([Show].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(.success(JSONData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
