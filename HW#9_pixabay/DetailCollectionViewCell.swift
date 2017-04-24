//
//  CollectionViewCell.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var modelReference: ImageModel! {
        didSet {
            configXibCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.clipsToBounds = true
        photoImageView.backgroundColor = UIColor.black
    }
    
    func configXibCell () {
        if let url = URL(string: modelReference.imgURL) {
            NetworkManager.shared.getingImgWith(url: url, onSuccess: { (reponseImage) in
                self.photoImageView.image = reponseImage
            }, onFail: { (errorString) in
                print("wrong url")
            })
        }
    }
    
}
