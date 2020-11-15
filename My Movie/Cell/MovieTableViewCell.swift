//
//  MovieTableViewCell.swift
//  My Movie
//
//  Created by Elena Igumenova on 15.11.2020.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var voteLabel: UILabel!
    @IBOutlet var realeseLabel: UILabel!
    
    func cinfigureCell(for result: Result) {
        
        titleLable.text = result.title
        //voteLabel.text = String(popular.voteAverage!)
        realeseLabel.text = ""
        
        DispatchQueue.global().async {
            guard let stringURL = result.posterPath else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: imageData)
            }
        }
    }
    
}
