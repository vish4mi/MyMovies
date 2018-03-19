//
//  APIManager.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import Foundation
import ObjectMapper

class APIManager: NSObject {
    
    static let sharedManager: APIManager = {
        let instance = APIManager()
        // setup code
        return instance
    }()
    
    /// Get movies data
    func getMoviesData(with completion: @escaping([MoviesModel]?, Error?) -> Void) {
        let urlString = Constants.APIServiceMethods.myMoviesAPI
        // Set up the URL request
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {(data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let responseArray = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [[String: Any]] else {
                        print("error trying to convert data to JSON")
                        return
                }
                let movieModels = Mapper<MoviesModel>().mapArray(JSONArray: responseArray)
                completion(movieModels, nil)
                
            } catch let error as NSError {
                print("error trying to convert data to JSON")
                completion(nil, error)
                return
            }
        }
        task.resume()
    }
}
