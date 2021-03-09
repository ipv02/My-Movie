
import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // MARK: - Private propertys
    private let urlStringPopular = "https://api.themoviedb.org/3/movie/popular?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let urlStringTopList = "https://api.themoviedb.org/3/movie/top_rated?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let urlStringUpcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    
    private var popular: Popular?
    private var topList: TopList?
    private var upcoming: Upcoming?

    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
        fetchData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popular?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let popularResult = popular?.results?[indexPath.row] else { return cell }
            cell.configurePopularCell(for: popularResult)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            guard let topListResults = topList?.results?[indexPath.row] else { return cell }
            cell.configureTopListCell(for: topListResults)
        } else {
            guard let upcomingResult = upcoming?.results?[indexPath.row] else { return cell }
            cell.configureUpcomingCell(for: upcomingResult)
        }
        
        return cell
    }
    
    //MARK: - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Fetch data movie
    private func fetchData() {
        
        NetworkManager.shared.fetchPopularMovie(from: urlStringPopular) { [weak self] popular  in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.popular = popular
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchTopListMovie(from: urlStringTopList) { [weak self] topList in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.topList = topList
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchUpcomingMovie(from: urlStringUpcoming) { [weak self] upcoming in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.upcoming = upcoming
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - IB Action
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsMovieVC = segue.destination as! DetailsMovieViewController
        
        if segmentedControl.selectedSegmentIndex == 0 {
            detailsMovieVC.resultPopular = popular?.results?[indexPath.row]
            detailsMovieVC.resultTop = nil
            detailsMovieVC.resultUpcoming = nil
        } else if segmentedControl.selectedSegmentIndex == 1 {
            detailsMovieVC.resultTop = topList?.results?[indexPath.row]
            detailsMovieVC.resultPopular = nil
            detailsMovieVC.resultUpcoming = nil
        } else {
            detailsMovieVC.resultUpcoming = upcoming?.results?[indexPath.row]
            detailsMovieVC.resultPopular = nil
            detailsMovieVC.resultTop = nil
        }
    }
}





