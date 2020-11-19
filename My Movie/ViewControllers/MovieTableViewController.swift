//
//  MovieTableViewController.swift
//  My Movie
//
//  Created by Elena Igumenova on 15.11.2020.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    private let urlStringPopular = "https://api.themoviedb.org/3/movie/popular?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let urlStringTopList = "https://api.themoviedb.org/3/movie/top_rated?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    private let urlStringUpcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=0a5763bed0839ef86647f9283eccf5dc&language=en-US&page=1"
    
    private var popular: Popular?
    private var topList: TopList?
    private var upcoming: Upcoming?
    
    
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
        NetworkManager.shared.fetchPopularMovie(from: urlStringPopular) { popular  in
            DispatchQueue.main.async {
                self.popular = popular
                self.tableView.reloadData()
            }
        }
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



    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsMovieVC = segue.destination as! DetailsMovieViewController
        detailsMovieVC.resultPopular = popular?.results?[indexPath.row]

    }

    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            NetworkManager.shared.fetchPopularMovie(from: urlStringPopular) { popular in
                DispatchQueue.main.async {
                    self.popular = popular
                    self.tableView.reloadData()
                }
            }
        case 1:
            NetworkManager.shared.fetchTopListMovie(from: urlStringTopList) { topList in
                DispatchQueue.main.async {
                    self.topList = topList
                    self.tableView.reloadData()
                }
            }
        case 2:
            NetworkManager.shared.fetchUpcomingMovie(from: urlStringUpcoming) { upcoming in
                DispatchQueue.main.async {
                    self.upcoming = upcoming
                    self.tableView.reloadData()
        }
        
        
    }
        default:
            break
        }
    }
}
