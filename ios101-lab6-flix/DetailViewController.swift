//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by Jack Camas on 3/25/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        if let voteAverage = movie.voteAverage {
            voteLabel.text = "Vote Average: \(voteAverage)"
        } else {
            voteLabel.text = ""
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let releaseDate = movie.releaseDate {
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        } else {
            releaseDateLabel.text = ""
        }
        
    
        if let posterPath = movie.posterPath,
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
            Nuke.loadImage(with: imageUrl, into: posterImageView)
        }

        if let backdropPath = movie.backdropPath,
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {
            Nuke.loadImage(with: imageUrl, into: backdropImageView)
        }
    }
}
