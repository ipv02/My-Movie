
import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var realeseLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    func configure(for result: ResultPopular) {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = result.posterPath else { return }
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.movieImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    func configureTopListCell(for results: ResultTop) {
        
        titleLable.text = results.title
        voteLabel.text = "⭐️ \(String(results.voteAverage!))"
        realeseLabel.text = "🎬: \(results.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = results.posterPath else { return }
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    func configureUpcomingCell(for results: ResultUpcoming) {
        
        titleLable.text = results.title
        voteLabel.text = "⭐️ \(String(results.voteAverage!))"
        realeseLabel.text = "🎬: \(results.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = results.posterPath else { return }
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: imageData)
            }
        }
    }
    
}
