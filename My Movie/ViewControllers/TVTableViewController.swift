

import UIKit

class TVTableViewController: UITableViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // MARK: - Private propertys
    private let popularTVUrl = "https://api.themoviedb.org/3/tv/popular?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    
    private var popularTV: PopularTV?

    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
        NetworkManager.shared.fetchPopularTV(from: popularTVUrl) { popularTV in
            DispatchQueue.main.async {
                self.popularTV = popularTV
                self.tableView.reloadData()
            }
        }

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
            
        } else {
            
        }


        return cell
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
