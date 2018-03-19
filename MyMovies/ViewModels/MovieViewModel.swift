//
//  MovieViewModel.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation

class MovieViewModel: NSObject, MovieViewModelProtocol {
    
    /// Content Title
    internal var title: String?
    
    /// Content Image
    internal var image: String?
    
    /// Content rating
    internal var rating: String?
    
    /// Release year
    internal var releaseYear: String?
    
    /// Genre
    internal var genre: String?
    
    
    init(with model: MoviesModel) {
        if let aTitle = model.title {
            title = aTitle
        }
        
        if let aGenre = model.genre {
            var genreString = ""
            
            for genreTitle in aGenre {
                genreString = genreString.count > 0 ? genreString + ", " + genreTitle : genreTitle
            }
            genre = genreString
        }
        
        if let imageURL = model.image {
            image = imageURL
        }
        
        if let aRating = model.rating {
            rating = String(aRating)
        }
        
        if let aReleaseYear = model.releaseYear {
            releaseYear = "Released in: \(aReleaseYear)"
        }
    }
}
