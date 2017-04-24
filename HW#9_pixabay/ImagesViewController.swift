//
//  ViewController.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

let cellIdentifire = "ImagesTableViewCell"
let segueToDetailID = "segueToDetail"

class ImagesViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var model: [ImageModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }
    
    func loadPosts () {
        NetworkManager.shared.getPost(onSuccess: { (responseObject) in
            self.model = responseObject
            self.myTableView.reloadData()
        }) { (errorString) in
            let alert = UIAlertController(title: errorString, message: "Error, error,error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
}

extension ImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! ImagesTableViewCell
        cell.post = model[indexPath.row]
        
        return cell
    }
    
}

extension ImagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire)
        performSegue(withIdentifier: segueToDetailID, sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailID {
            if let selectedPath = self.myTableView.indexPathForSelectedRow {
                if let controller = segue.destination as? DetailCollectionViewController {
                    controller.modelReference = model[selectedPath.row]
                }
            }
            
        }
    }
    
}






















