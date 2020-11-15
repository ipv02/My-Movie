
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPopularMovie(from urlString: String, with completion: @escaping (Popular) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            do {
                let popular = try JSONDecoder().decode(Popular.self, from: data)
                completion(popular)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
