

import UIKit

class TVTableViewController: UITableViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // MARK: - Private propertys
    private let popularTVUrl = "https://api.themoviedb.org/3/tv/popular?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let topTVUrl = "https://api.themoviedb.org/3/tv/top_rated?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let onTheAirUrl = "https://api.themoviedb.org/3/tv/on_the_air?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    
    private var popularTV: PopularTV?
    private var topTV: TopTV?
    private var onTheAir: OnTheAir?

    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
        fetchDataTV()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularTV?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvShowsCell", for: indexPath) as! TVTableViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let popularResultTV = popularTV?.results?[indexPath.row] else { return cell }
            cell.configurePopularTVCell(for: popularResultTV)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            guard let topResultTV = topTV?.results?[indexPath.row] else { return cell }
            cell.configureTopTVCell(for: topResultTV)
        } else {
            guard let onTheAirTV = onTheAir?.results?[indexPath.row] else { return cell }
            cell.configureOnTheAirTVCell(for: onTheAirTV)
        }


        return cell
    }
    
    //MARK: - Fetch data TV
    private func fetchDataTV() {
        
        NetworkManager.shared.fetchPopularTV(from: popularTVUrl) { popularTV in
            DispatchQueue.main.async {
                self.popularTV = popularTV
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchTopTV(from: topTVUrl) { topTV in
            DispatchQueue.main.async {
                self.topTV = topTV
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchOnTheAir(from: onTheAirUrl) { onTheAir in
            DispatchQueue.main.async {
                self.onTheAir = onTheAir
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Actions
    @IBAction func didChangedSegment(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsTVVC = segue.destination as! DetailsTVViewController
        
        if segmentedControl.selectedSegmentIndex == 0 {
            detailsTVVC.resultPopularTV = popularTV?.results?[indexPath.row]
            detailsTVVC.resultTopTV = nil
            detailsTVVC.resultOnTheAir = nil
        } else if segmentedControl.selectedSegmentIndex == 1 {
            detailsTVVC.resultTopTV = topTV?.results?[indexPath.row]
            detailsTVVC.resultPopularTV = nil
            detailsTVVC.resultOnTheAir = nil
        } else {
            detailsTVVC.resultOnTheAir = onTheAir?.results?[indexPath.row]
            detailsTVVC.resultPopularTV = nil
            detailsTVVC.resultTopTV = nil
        }
    }

}
