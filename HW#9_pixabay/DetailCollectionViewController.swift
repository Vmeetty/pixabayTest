//
//  DetailCollectionViewController.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "detailCell"

class DetailCollectionViewController: UICollectionViewController {
    
    var modelReference: ImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
         let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = (self.collectionView?.frame.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DetailCollectionViewCell
        cell.modelReference = self.modelReference
    
        return cell
    }

}
