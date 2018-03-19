//
//  MoviesModel.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesModel: NSObject, NSCoding, Mappable {
    
    /// Content Title
    var title: String?
    
    /// Content Image
    var image: String?
    
    /// Content rating
    var rating: Float?
    
    /// Release year
    var releaseYear: Int64?
    
    /// Genre
    var genre: [String]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        title        <- map["title"]
        image        <- map["image"]
        rating       <- map["rating"]
        releaseYear  <- map["releaseYear"]
        genre        <- map["genre"]
    }
    
    required init(coder decoder: NSCoder) {
        title = (decoder.decodeObject(forKey: "title") as? String)
        image = (decoder.decodeObject(forKey: "image") as? String)
        rating = (decoder.decodeObject(forKey: "rating") as? Float ?? 0)
        releaseYear = (decoder.decodeObject(forKey: "releaseYear") as? Int64)
        genre = (decoder.decodeObject(forKey: "genre") as? [String])
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(releaseYear, forKey: "releaseYear")
        aCoder.encode(genre, forKey: "genre")
    }
}
