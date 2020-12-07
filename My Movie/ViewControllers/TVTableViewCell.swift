

import UIKit
import Kingfisher

class TVTableViewCell: UITableViewCell {
    
    @IBOutlet var tvImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var airDateLabel: UILabel!
    

    //MARK: - PopularTV Cell
    func configurePopularTVCell(for result: ResultPopularTV) {
        
        nameLabel.text = result.name
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        airDateLabel.text = "🎬: \(result.firstAirDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.tvImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    //MARK: - TopTV Cell
    func configureTopTVCell(for result: ResultTopTV) {
        
        nameLabel.text = result.name
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        airDateLabel.text = "🎬: \(result.firstAirDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.tvImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    //MARK: - On the air TV Cell
    func configureOnTheAirTVCell(for result: ResultOnTheAir) {
        
        nameLabel.text = result.name
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        airDateLabel.text = "🎬: \(result.firstAirDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.tvImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
