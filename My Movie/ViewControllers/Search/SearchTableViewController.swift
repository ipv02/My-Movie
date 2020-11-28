

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
        
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
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
    
    //MARK: - Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        NetworkManager.shared.fetchDataSearchMovie(from: "https://api.themoviedb.org/3/search/movie?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&query=\(searchText)&page=1&include_adult=false") { searchMovie in
            DispatchQueue.main.async {
                self.searchMovie = searchMovie
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.shared.fetchDataSearchTVShow(from: "https://api.themoviedb.org/3/search/tv?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1&query=\(searchText)&include_adult=false") { searchTVShow in
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
