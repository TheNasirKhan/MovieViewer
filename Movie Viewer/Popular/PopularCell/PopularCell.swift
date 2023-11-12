//
//  PopularCell.swift
//  Movie Viewer
//
//  Created by Nasir Ahmed Khan on 12/11/2023.
//

import UIKit
import SDWebImage

class PopularCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(movie: Movie?) {
        titleLabel.text = movie?.title
        dateLabel.text = movie?.release_date
        let baseImageURL = NetworkManager.shared.imageBaseURL
        if let posterPath = movie?.poster_path, let imageUrl = URL(string: baseImageURL + posterPath) {
            posterImage.sd_setImage(with: imageUrl)
        }
    }
    
}
