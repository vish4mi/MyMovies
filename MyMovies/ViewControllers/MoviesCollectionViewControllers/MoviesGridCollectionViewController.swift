//
//  MoviesGridCollectionViewController.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class MoviesGridCollectionViewController: UIViewController {

    private var movieViewModel: [MovieViewModel]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.sharedManager.getMoviesData { (moviesData, error) in
            if let moviemodels = moviesData {
                if self.movieViewModel == nil {
                    self.movieViewModel = [MovieViewModel]()
                }
                for movieModel in moviemodels {
                    let movieViewModel = MovieViewModel(with: movieModel)
                    self.movieViewModel?.append(movieViewModel)
                }
            } else {
                DBHandler.sharedHandler.fetchMoviesData(with: { (moviesData, error) in
                    if let moviemodels = moviesData {
                        if self.movieViewModel == nil {
                            self.movieViewModel = [MovieViewModel]()
                        }
                        for movieModel in moviemodels {
                            let movieViewModel = MovieViewModel(with: movieModel)
                            self.movieViewModel?.append(movieViewModel)
                        }
                    }
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
