
import UIKit
import Kingfisher

class ActorsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    
    //MARK: - Cast Cell
    func configure(for cast: Cast) {

        nameLabel.text = cast.name
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(cast.profilePath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }

            DispatchQueue.main.async {
                self.photoImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
