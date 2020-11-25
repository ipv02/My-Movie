
import UIKit


class DetailsMovieViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var movieImageView: ImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    private var video: Video?
    private var credits: Credits?
    
    var resultPopular: ResultPopular!
    var resultTop: ResultTop!
    var resultUpcoming: ResultUpcoming!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupNavigationBar()
        setupButtonView()
        dataManager()
    }
    
    // MARK: - Private methods
    private func dataManager() {
        if resultPopular != nil && resultTop == nil && resultUpcoming == nil {
            setupPopularMovieDetails()
            fetchPopularVideo()
            fetchPopularCredits()
        } else if resultTop != nil && resultPopular == nil && resultUpcoming == nil {
            setupToplistMovieDetails()
            fetchTopVideo()
            fetchTopCredits()
        } else if resultUpcoming != nil && resultPopular == nil && resultTop == nil {
            setupUpcomingMovieDetails()
            fetchUpcomingVideo()
            fetchUpcomingCredits()
        }
    }
    
    //MARK: - Setup details
    private func setupPopularMovieDetails() {
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(resultPopular.posterPath ?? "")")
        nameLabel.text = resultPopular.title
        overviewLabel.text = resultPopular.overview
        navigationItem.title = resultPopular.title
        
    }
    
    private func setupToplistMovieDetails() {
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(resultTop.posterPath ?? "")")
        nameLabel.text = resultTop.title
        overviewLabel.text = resultTop.overview
        navigationItem.title = resultTop.title
    }
    
    private func setupUpcomingMovieDetails() {
        movieImageView.fetchImage(from: "https://image.tmdb.org/t/p/w500/\(resultUpcoming.posterPath ?? "")")
        nameLabel.text = resultUpcoming.title
        overviewLabel.text = resultUpcoming.overview
        navigationItem.title = resultUpcoming.title
    }
    
    //MARK: - Fetch video
    private func fetchPopularVideo() {
        NetworkManager.shared.fetchMovieVideo(from: "https://api.themoviedb.org/3/movie/\(resultPopular?.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { video in
            self.video = video
        }
    }
    
    private func fetchTopVideo() {
        NetworkManager.shared.fetchMovieVideo(from: "https://api.themoviedb.org/3/movie/\(resultTop?.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { video in
            self.video = video
        }
    }
    
    private func fetchUpcomingVideo() {
        NetworkManager.shared.fetchMovieVideo(from: "https://api.themoviedb.org/3/movie/\(resultUpcoming?.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { video in
            self.video = video
        }
    }
    
    //MARK: - Fetch Credits
    private func fetchPopularCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/movie/\(resultPopular.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { credits in
            DispatchQueue.main.async {
                self.credits = credits
                self.tableView.reloadData()
            }
        }
    }
    
    private func fetchTopCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/movie/\(resultTop.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { credits in
            DispatchQueue.main.async {
                self.credits = credits
                self.tableView.reloadData()
            }
        }
    }
    
    private func fetchUpcomingCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/movie/\(resultUpcoming.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { credits in
            DispatchQueue.main.async {
                self.credits = credits
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Setup navigation bar and button
    private func setupNavigationBar() {
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            topItem.backBarButtonItem?.tintColor = .black
        }
    }
    
    private func setupButtonView() {
        playButton.layer.cornerRadius = 10
        playButton.backgroundColor = .white
        playButton.titleLabel?.textColor = .black
        playButton.layer.shadowColor = UIColor.black.cgColor
        playButton.layer.shadowRadius = 4
        playButton.layer.shadowOpacity = 0.2
        playButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        
    }
    
    // MARK: - Actions
    @IBAction func playButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "videoSegue", sender: nil)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videoSegue" {
            let videoVC = segue.destination as! VideoViewController
            videoVC.resultVideo = video?.results?.first
        }
    }
}

// MARK: - Extension
extension DetailsMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credits?.cast?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorsTableViewCell
        
        guard let cast = credits?.cast?[indexPath.row] else { return cell }
        cell.configure(for: cast)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Actors"
    }
}
