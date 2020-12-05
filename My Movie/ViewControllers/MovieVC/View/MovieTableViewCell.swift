
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
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
       
        activityIndicator.stopAnimating()
        //movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            //guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                //self.movieImageView.image = UIImage(data: imageData)
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    func configureTopListCell(for result: ResultTop) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        //movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            //guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                //self.movieImageView.image = UIImage(data: imageData)
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    func configureUpcomingCell(for result: ResultUpcoming) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        //movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            //guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                //self.movieImageView.image = UIImage(data: imageData)
                self.movieImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
