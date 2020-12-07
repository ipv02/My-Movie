
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var realeseLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Life cicle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    //MARK: - Popular Cell
    func configurePopularCell(for result: ResultPopular) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
       
        activityIndicator.stopAnimating()
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    //MARK: - TopList Cell
    func configureTopListCell(for result: ResultTop) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    //MARK: - Upcoming Cell
    func configureUpcomingCell(for result: ResultUpcoming) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
