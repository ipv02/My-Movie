
import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: ImageView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var realeseLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func configurePopularCell(for result: ResultPopular) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
       
        //guard let stringURL = result.posterPath else { return }
        activityIndicator.stopAnimating()
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
        
//        DispatchQueue.global().async {
//            guard let stringURL = result.posterPath else { return }
//            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.activityIndicator.stopAnimating()
//                self.movieImageView.image = UIImage(data: imageData)
//            }
//        }
    }
    
    func configureTopListCell(for result: ResultTop) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
//        DispatchQueue.global().async {
//            guard let stringURL = results.posterPath else { return }
//            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.movieImageView.image = UIImage(data: imageData)
//            }
//        }
    }
    
    func configureUpcomingCell(for result: ResultUpcoming) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
//        DispatchQueue.global().async {
//            guard let stringURL = result.posterPath else { return }
//            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.movieImageView.image = UIImage(data: imageData)
//            }
//        }
    }
    
}
