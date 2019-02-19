//
//  FeedDelayController.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/15/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

protocol FeedFetchedDelegate: class {
    func didReceiveAllData()
}

class FeedDelayController: UIViewController, FeedFetchedDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    
    //MARK: properties
    
    
    //MARK: setup methods
    func setupViews(){
        didReceiveAllData()
    }
    
    
    func didReceiveAllData() {
        guard
            let window = UIApplication.shared.keyWindow
        else {
            return
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let navController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        window.rootViewController = navController
    }

}//end class





























