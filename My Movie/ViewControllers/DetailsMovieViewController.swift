
import UIKit

class DetailsMovieViewController: UIViewController {
    
    @IBOutlet var movieImageView: ImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var resultPopular: ResultPopular!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(resultPopular.posterPath ?? "")")
        nameLabel.text = resultPopular.title

    }
    


}

extension DetailsMovieViewController: UITabBarDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath)
        
        return cell
    }
    
    
    
}
