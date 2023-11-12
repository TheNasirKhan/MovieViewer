//
//  DetailViewController.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovie { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }
    
    func setupUI() {
        let baseImageURL = NetworkManager.shared.imageBaseURL
        let movie = viewModel.popularMovie
        if let posterPath = movie?.poster_path, let imageUrl = URL(string: baseImageURL + posterPath) {
            posterImage.sd_setImage(with: imageUrl)
        }
        titleLabel.text = movie?.original_title
        tagLineLabel.text = movie?.tagline
        dateLabel.text = movie?.release_date
        genresLabel.text = movie?.genres.map { $0.name }.joined(separator: " . ")
        overviewLabel.text = movie?.overview
        //Note We can show all other detail on this screen according to the requirements
    }
    
}
