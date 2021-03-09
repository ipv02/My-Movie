

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
        
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    //MARK: - Properties
    private var searchMovie: SearchMovie?
    private var searchTVShow: SearchTVShow?

    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovie?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let searchResult = searchMovie?.results?[indexPath.row] else { return cell }
            cell.configureSearchMovieCell(for: searchResult)
        } else {
            guard let searchResultTV = searchTVShow?.results?[indexPath.row] else { return cell }
            cell.configureSearchTVShowCell(for: searchResultTV)
        }
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let searchMovie = searchMovie?.results?[indexPath.row] else { return }
            performSegue(withIdentifier: "searchMovieDetails", sender: searchMovie)
        } else {
            guard let searchTV = searchTVShow?.results?[indexPath.row] else { return }
            performSegue(withIdentifier: "searchTVDetails", sender: searchTV)
        }
    }
    
    //MARK: - Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        NetworkManager.shared.fetchDataSearchMovie(from: "https://api.themoviedb.org/3/search/movie?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&query=\(searchText)&page=1&include_adult=false") { [weak self] searchMovie in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.searchMovie = searchMovie
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchDataSearchTVShow(from: "https://api.themoviedb.org/3/search/tv?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1&query=\(searchText)&include_adult=false") { [weak self] searchTVShow in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.searchTVShow = searchTVShow
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Actions
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchMovieDetails" {
            let detailsMovieVC = segue.destination as! DetailsMovieViewController
            detailsMovieVC.resultSearchMovie = sender as? ResultSearchMovie
        } else {
            let detailsTVVC = segue.destination as! DetailsTVViewController
            detailsTVVC.resultSearchTVShow = sender as? ResultSearchTVShow
        }
    }
}
