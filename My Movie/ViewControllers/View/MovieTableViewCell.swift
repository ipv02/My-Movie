
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
       
        activityIndicator.stopAnimating()
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
    }
    
    func configureTopListCell(for result: ResultTop) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
    }
    
    func configureUpcomingCell(for result: ResultUpcoming) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        realeseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")")
    }
}
