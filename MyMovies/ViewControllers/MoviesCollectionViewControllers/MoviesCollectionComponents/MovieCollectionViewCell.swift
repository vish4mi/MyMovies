//
//  MovieCollectionViewCell.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieDetailsView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        movieRating.layer.borderColor = UIColor.lightGray.cgColor
        movieRating.layer.borderWidth = 1.0
        movieRating.layer.cornerRadius = movieRating.frame.width/2
        
        movieDetailsView.layer.borderColor = UIColor.lightGray.cgColor
        movieDetailsView.layer.borderWidth = 1.0
        
    }

    func setupCell(with viewModel: MovieViewModel?) {
        movieImageView.kf.setImage(with: URL(string: (viewModel?.image)!), placeholder: "poster-placeholder" as? Placeholder, options: nil, progressBlock: nil, completionHandler: nil)
        movieTitle.text = viewModel?.title
        movieGenre.text = viewModel?.genre
        movieRating.text = viewModel?.rating
        movieReleaseYear.text = viewModel?.releaseYear
    }
}
