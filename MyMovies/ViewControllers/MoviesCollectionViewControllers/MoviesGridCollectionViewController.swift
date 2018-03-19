//
//  MoviesGridCollectionViewController.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit

class MoviesGridCollectionViewController: UIViewController {

    private let movieCollectionCellIdentifier = "MovieCollectionViewCell"
    private var movieViewModels: [MovieViewModel]? = nil
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovieCollectioView()
        fetchMoviesData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureMovieCollectioView() {
        navigationItem.title = "My Movies"
        self.movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: movieCollectionCellIdentifier)
    }
    
    func fetchMoviesData() {
        APIManager.sharedManager.getMoviesData { (moviesData, error) in
            if let moviemodels = moviesData {
                DBHandler.sharedHandler.updateDB(with: moviemodels)
                if self.movieViewModels == nil {
                    self.movieViewModels = [MovieViewModel]()
                }
                for movieModel in moviemodels {
                    let movieViewModel = MovieViewModel(with: movieModel)
                    self.movieViewModels?.append(movieViewModel)
                    self.movieCollectionView.reloadData()
                }
            } else {
                DBHandler.sharedHandler.fetchMoviesData(with: { (moviesData, error) in
                    if let moviemodels = moviesData {
                        if self.movieViewModels == nil {
                            self.movieViewModels = [MovieViewModel]()
                        }
                        for movieModel in moviemodels {
                            let movieViewModel = MovieViewModel(with: movieModel)
                            self.movieViewModels?.append(movieViewModel)
                            self.movieCollectionView.reloadData()
                        }
                    }
                })
            }
        }
    }

}

extension MoviesGridCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        if let moviesData = movieViewModels {
            numberOfItems = moviesData.count
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCollectionCellIdentifier, for: indexPath) as! MovieCollectionViewCell
        movieCell.configure()
        
        var movieViewModel: MovieViewModel? = nil
        if let movieViewModelArray = movieViewModels, indexPath.row < movieViewModelArray.count {
            movieViewModel = movieViewModelArray[indexPath.row]
            movieCell.setupCell(with: movieViewModel)
        }
        return movieCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension MoviesGridCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize.zero
        let deviceWidth = collectionView.frame.width
        itemSize = CGSize(width: (deviceWidth-30)/2, height: ((deviceWidth-30)/2) + 120)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
