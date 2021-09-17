//
//  CollectionPhotosViewController.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import UIKit

import UIKit

class CollectionPhotosViewController: UIViewController {
    var searchText : String?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(searchText)
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionImageCell", bundle: nil), forCellWithReuseIdentifier: "collectionImageCell")
    }
            
}

extension CollectionPhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionImageCell", for: indexPath)
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
