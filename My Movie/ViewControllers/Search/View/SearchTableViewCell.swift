

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureSearchCell(for result: ResultSearchMovie) {
        
        nameLabel.text = result.title
        voteLabel.text = "⭐️ \(String(result.voteAverage!))"
        releaseLabel.text = "🎬: \(result.releaseDate ?? "")"
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(result.posterPath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.searchImageView.image = UIImage(data: imageData)
            }
        }
    }

}
