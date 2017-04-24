//
//  ImageTableViewCell.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    var post: ImageModel! {
        didSet {
            configPostCell()
        }
    }
    
    func configPostCell () {
        nameLabel.text = post.name
        tagsLabel.text = post.tags
        if let url = URL(string: post.previewURL) {
            NetworkManager.shared.getingImgWith(url: url, onSuccess: { (responceImg) in
                self.previewImageView.image = responceImg
            }, onFail: { (errorString) in
                print("Wrong preview URL")
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
