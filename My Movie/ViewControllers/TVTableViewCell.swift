

import UIKit

class TVTableViewCell: UITableViewCell {
    
    @IBOutlet var tvImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var airDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configurePopularTVCell(for result: ResultPopularTV) {
        
        nameLabel.text = result.name
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        airDateLabel.text = "🎬: \(result.firstAirDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.tvImageView.image = UIImage(data: imageData)
            }
        }
    }

}
