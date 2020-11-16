
import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var realeseLabel: UILabel!
    
    func configure(for result: Result) {
        
        titleLable.text = result.title
        voteLabel.text = "⭐️ \(String(result.vote_average!))"
        realeseLabel.text = "🎬: \(result.release_date ?? "")"
        

        DispatchQueue.global().async {
            guard let stringURL = result.poster_path else { return }
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(stringURL)") else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: imageData)
            }
        }
    }
    
}
