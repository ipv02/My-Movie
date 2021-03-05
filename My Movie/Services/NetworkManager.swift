
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    //MARK: - Fetch Movie
    func fetchPopularMovie(from urlString: String, with completion: @escaping (Popular) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            guard let popular = self.decodeJSON(type: Popular.self, from: data) else { return }
            completion(popular)
        }.resume()
    }
    
    func fetchTopListMovie(from urlString: String, with completion: @escaping (TopList) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            guard let topList = self.decodeJSON(type: TopList.self, from: data) else { return }
            completion(topList)
        }.resume()
    }
    
    func fetchUpcomingMovie(from urlString: String, with completion: @escaping (Upcoming) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            guard let upcoming = self.decodeJSON(type: Upcoming.self, from: data) else { return }
            completion(upcoming)
        }.resume()
    }
    
    //MARK: - Fetch Movie and TV Video
    func fetchMovieTVVideo(from urlString: String, with completion: @escaping (Video) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let video = self.decodeJSON(type: Video.self, from: data) else { return }
            completion(video)
        }.resume()
    }
    
    //MARK: - Fetch Credits Movie and TV
    func fetchCredits(from urlString: String, with completion: @escaping (Credits) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let credits = self.decodeJSON(type: Credits.self, from: data) else { return }
            completion(credits)
        }.resume()
    }
    
    //MARK: - Fetch TV Show
    func fetchPopularTV(from urlString: String, with completion: @escaping (PopularTV) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let popularTV = self.decodeJSON(type: PopularTV.self, from: data) else { return }
            completion(popularTV)
        }.resume()
    }
    
    func fetchTopTV(from urlString: String, with completion: @escaping (TopTV) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let topTV = self.decodeJSON(type: TopTV.self, from: data) else { return }
            completion(topTV)
        }.resume()
    }
    
    func fetchOnTheAir(from urlString: String, with completion: @escaping (OnTheAir) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let onTheAir = self.decodeJSON(type: OnTheAir.self, from: data) else { return }
            completion(onTheAir)
        }.resume()
    }
    
    //MARK: - Search Movie
    func fetchDataSearchMovie(from urlString: String, with completion: @escaping (SearchMovie) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let searchMoview = self.decodeJSON(type: SearchMovie.self, from: data) else { return }
            completion(searchMoview)
        }.resume()
    }
    
    //MARK: - Search TV Show
    func fetchDataSearchTVShow(from urlString: String, with completion: @escaping (SearchTVShow) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }
            
            guard let searchTVShow = self.decodeJSON(type: SearchTVShow.self, from: data) else { return }
            completion(searchTVShow)
        }.resume()
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from else { return nil }
        
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let error {
            print(error)
            return nil
        }
    }
}
