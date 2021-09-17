//
//  CollectionViewController.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var searchText : String?
    private let service = BaseService()
    private var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqure()
        loadData()

    }
    
    private func confiqure()  {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        collectionView.delegate = self
        collectionView.dataSource = self
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionImageCell")
    }
    
    private func loadData() {
        guard let text = searchText else {
            return
        }
        service.loadPhotos(about: text, onComplete: { [weak self] (photos) in
            self?.photos.append(contentsOf: photos)
            self?.collectionView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    func stopIndictaor() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
            
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionImageCell", for: indexPath) as? PhotoCollectionViewCell else {
            stopIndictaor()
            return UICollectionViewCell()
        }
        let model = photos[indexPath.row]
        cell.customImageView.loadImage(by: model.urls.regular)
        if indexPath.row == 0{
            stopIndictaor()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == photos.count - 1, service.canLoadMore == true {
            loadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWight = Double(collectionView.bounds.width) - 30
        let cellHeight = cellWight / 10 * 7
        return CGSize(width: cellWight, height: cellHeight)
    }


}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


