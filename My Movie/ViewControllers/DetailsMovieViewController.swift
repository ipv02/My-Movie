
import UIKit


class DetailsMovieViewController: UIViewController {
    
    @IBOutlet var movieImageView: ImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    var resultPopular: ResultPopular!
    var video: Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(resultPopular.posterPath ?? "")")
        nameLabel.text = resultPopular.title
        overviewLabel.text = resultPopular.overview
        
    }
    


    @IBAction func playButtonAction(_ sender: Any) {
        
        NetworkManager.shared.fetchMovieVideo(from: "https://api.themoviedb.org/3/movie/\(resultPopular.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { (video) in
            DispatchQueue.main.async {
                self.video = video
            }
        }
        
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
