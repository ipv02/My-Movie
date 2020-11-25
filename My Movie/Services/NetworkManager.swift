
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
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let popular = try decoder.decode(Popular.self, from: data)
                completion(popular)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchTopListMovie(from urlString: String, with completion: @escaping (TopList) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let topList = try decoder.decode(TopList.self, from: data)
                completion(topList)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchUpcomingMovie(from urlString: String, with completion: @escaping (Upcoming) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let upcoming = try decoder.decode(Upcoming.self, from: data)
                completion(upcoming)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    //MARK: - Fetch Movie Video
    func fetchMovieVideo(from urlString: String, with completion: @escaping (Video) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let video = try decoder.decode(Video.self, from: data)
                completion(video)
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
    
    //MARK: - Fetch Credits Movie
    func fetchCredits(from urlString: String, with completion: @escaping (Credits) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let credits = try decoder.decode(Credits.self, from: data)
                completion(credits)
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
    
    //MARK: - Fetch TV Show
    func fetchPopularTV(from urlString: String, with completion: @escaping (PopularTV) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {print(error); return }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let popularTV = try decoder.decode(PopularTV.self, from: data)
                completion(popularTV)
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
