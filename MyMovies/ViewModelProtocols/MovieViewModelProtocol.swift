//
//  MovieViewModelProtocol.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation


protocol MovieViewModelProtocol: NSObject {
    
    /// Content Title
    var title: String? { get }
    
    /// Content Image
    var image: String? { get }
    
    /// Content rating
    var rating: String? { get }
    
    /// Release year
    var releaseYear: String? { get }
    
    /// Genre
    var genre: String? { get }
}
