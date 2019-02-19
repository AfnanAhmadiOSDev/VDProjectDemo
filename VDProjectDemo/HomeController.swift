//
//  HomeController.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/8/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit
import AVKit

protocol MenuBTnClickDelegate: class {
    func menuBtnPressed(buttonId: Int)
}

let numberOfCells: Int = 4

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MenuBTnClickDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupCollectionView()
        
        addBottomContainer()
    }
    
    
    //MARK: properties
    lazy var sideBarButton: UIBarButtonItem = {
        let imageV : UIImageView = {
            let imgV = UIImageView()
            imgV.contentMode = .scaleAspectFit
            imgV.clipsToBounds = true
            
            return imgV
        }()
        let jBtn = UIButton()
        jBtn.frame = CGRect(x: 0, y: 0, width: 5, height: 20)
        jBtn.setBackgroundImage(imageV.image, for: .normal)
        let button = UIBarButtonItem(customView: jBtn)
        button.style = UIBarButtonItemStyle.plain
        button.target = self
        
        return button
    }()
    let bottomContainer: MyMenuBar = {
        let vi = MyMenuBar()
        vi.translatesAutoresizingMaskIntoConstraints = false
        
        return vi
    }()
    
    
    
    //MARK: setup methods
    func addBottomContainer(){
        bottomContainer.menuBtnDelegateObj = self
        view.addSubview(bottomContainer)
        
        bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupNavBar(){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "My Video Downloader"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.rightBarButtonItem = sideBarButton
        
        navigationController?.navigationBar.barTintColor = .blue
        //navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
        navigationController?.navigationBar.tintColor = .white
    }
    func setupCollectionView(){
        self.collectionView?.backgroundColor = .gray
        
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: "homecellid")
        self.collectionView?.register(VideoListCell.self, forCellWithReuseIdentifier: "secondcellid")
        self.collectionView?.register(DownloadUrlCell.self, forCellWithReuseIdentifier: "DownloadUrlCellid")
        self.collectionView?.register(FourthCell.self, forCellWithReuseIdentifier: "FourthCellid")
        
        self.collectionView?.contentInset = UIEdgeInsetsMake(65, 0, 0, 0)
        self.collectionView?.bounces = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
    }
    
    
    
    //MARK: collection view methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.item == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecellid", for: indexPath) as! HomeCell
            
            return cell
        }
        else if(indexPath.item == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondcellid", for: indexPath) as! VideoListCell
            
            return cell
        }
        else if(indexPath.item == 2) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DownloadUrlCellid", for: indexPath) as! DownloadUrlCell
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthCellid", for: indexPath) as! FourthCell
            cell.backgroundColor = .gray
            
            return cell
        }
    }//end method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height-85)
    }
    
    
    
    //MARK: other methods
    func menuBtnPressed(buttonId: Int) {
        //print("In HOMECONTROLLER: \(buttonId)")
        self.collectionView?.scrollToItem(at: IndexPath(item: buttonId, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    
    
    
    
}//end class





























//NotificationCenter.default.addObserver(self, selector: #selector(self.myVideoPlayedInFullscreenFirstTime), name: NSNotification.Name(rawValue: "AVPlayerItemBecameCurrentNotification"), object: nil)

