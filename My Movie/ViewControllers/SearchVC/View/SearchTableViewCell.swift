

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!
    
    //MARK: - Search Movie Cell
    func configureSearchMovieCell(for result: ResultSearchMovie) {
        
        nameLabel.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        releaseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.searchImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    //MARK: - Search TV Show Cell
    func configureSearchTVShowCell(for result: ResultSearchTVShow) {

        nameLabel.text = result.name
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        releaseLabel.text = "🎬: \(result.firstAirDate ?? "")"

        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.searchImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
