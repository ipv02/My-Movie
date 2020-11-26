

import UIKit

class DetailsTVViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tvImageView: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    private var videoTV: Video?
    private var creditsTV: Credits?
    
    var resultPopularTV: ResultPopularTV!
    var resultTopTV: ResultTopTV!
    var resultOnTheAir: ResultOnTheAir!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        dataManager()
        setupNavigationBar()
        setupButtonView()

    }
    
    // MARK: - Private methods
    private func dataManager() {
        if resultPopularTV != nil && resultTopTV == nil && resultOnTheAir == nil {
            setupPopularTVDetails()
            fetchPopularTVVideo()
            fetchPopularTVCredits()
        } else if resultTopTV != nil && resultPopularTV == nil && resultOnTheAir == nil {
            setupTopTVDetails()
            fetchTopTVVideo()
            fetchTopTVCredits()
        } else if resultOnTheAir != nil && resultPopularTV == nil && resultTopTV == nil {
            setupOnTheAirDetails()
            fetchOnTheAirVideo()
            fetchOnTheAirTVCredits()
        }
    }
    
    //MARK: - Setup details
    private func setupPopularTVDetails() {
        
        nameLabel.text = resultPopularTV.name
        overviewLabel.text = resultPopularTV.overview
        navigationItem.title = resultPopularTV.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(self.resultPopularTV.posterPath ?? "")") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.tvImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    private func setupTopTVDetails() {
        
        nameLabel.text = resultTopTV.name
        overviewLabel.text = resultTopTV.overview
        navigationItem.title = resultTopTV.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(self.resultTopTV.posterPath ?? "")") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.tvImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    private func setupOnTheAirDetails() {
        
        nameLabel.text = resultOnTheAir.name
        overviewLabel.text = resultOnTheAir.overview
        navigationItem.title = resultOnTheAir.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(self.resultOnTheAir.posterPath ?? "")") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.tvImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    //MARK: - Fetch video TV
    private func fetchPopularTVVideo() {
        NetworkManager.shared.fetchMovieTVVideo(from: "https://api.themoviedb.org/3/tv/\(resultPopularTV.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US" ) { videoTV in
            self.videoTV = videoTV
        }
    }
    
    private func fetchTopTVVideo() {
        NetworkManager.shared.fetchMovieTVVideo(from: "https://api.themoviedb.org/3/tv/\(resultTopTV.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US" ) { videoTV in
            self.videoTV = videoTV
        }
    }
    
    private func fetchOnTheAirVideo() {
        NetworkManager.shared.fetchMovieTVVideo(from: "https://api.themoviedb.org/3/tv/\(resultOnTheAir.id ?? 0)/videos?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US" ) { videoTV in
            self.videoTV = videoTV
        }
    }
    
    //MARK: - Fetch Credits TV
    private func fetchPopularTVCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/tv/\(resultPopularTV.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { creditsTV in
            DispatchQueue.main.async {
                self.creditsTV = creditsTV
                self.tableView.reloadData()
            }
        }
    }
    
    private func fetchTopTVCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/tv/\(resultTopTV.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { creditsTV in
            DispatchQueue.main.async {
                self.creditsTV = creditsTV
                self.tableView.reloadData()
            }
        }
    }
    
    private func fetchOnTheAirTVCredits() {
        NetworkManager.shared.fetchCredits(from: "https://api.themoviedb.org/3/tv/\(resultOnTheAir.id ?? 0)/credits?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US") { creditsTV in
            DispatchQueue.main.async {
                self.creditsTV = creditsTV
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
    
    
    
    @IBAction func playButtonTVAction(_ sender: Any) {
        //performSegue(withIdentifier: "videoTVSegue", sender: nil)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videoTVSegue" {
            let videoTVVC = segue.destination as! VideoViewController
            videoTVVC.resultVideo = videoTV?.results?.first
        }
    }
}

extension DetailsTVViewController: UITabBarDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditsTV?.cast?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorTVCell", for: indexPath) as! ActorsTVTableViewCell
        
        guard let castTV = creditsTV?.cast?[indexPath.row] else { return cell }
        cell.configure(for: castTV)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Actors"
    }
    
    
    
}
