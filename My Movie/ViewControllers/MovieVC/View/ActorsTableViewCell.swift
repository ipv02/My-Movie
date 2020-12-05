
import UIKit
import Kingfisher

class ActorsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configure(for cast: Cast) {

        //photoImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(cast.profilePath ?? "")")
        
        nameLabel.text = cast.name
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        
        DispatchQueue.global().async {
            let stringUrl = "https://image.tmdb.org/t/p/w500/\(cast.profilePath ?? "")"
            guard let imageUrl = URL(string: stringUrl) else { return }
            //guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                //self.photoImageView.image = UIImage(data: imageData)
                self.photoImageView.kf.setImage(with: imageUrl)
            }
        }
    }
}
