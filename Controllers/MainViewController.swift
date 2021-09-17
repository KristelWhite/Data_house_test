//
//  MainViewController.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak private var searchButton: UIButton!
    @IBOutlet weak private var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.setTitle("Search", for: .normal)
        
    }
    @IBAction func searchButtonTouchUp(_ sender: Any) {
        performSegue(withIdentifier: "loadCollection", sender: textField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "loadCollection",
            let sender = sender as? String?,
            let vc = segue.destination as? CollectionViewController else { return }
        vc.searchText = sender 
       
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
