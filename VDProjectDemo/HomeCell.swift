//
//  HomeCell.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/8/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit
import AVFoundation

var videoListCount: Int = 0

class HomeCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: properties
    var footerHeight: CGFloat = 50
    //var homeCellFooterDlgte: CVFooterUpdateDelegate?
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        
        let colv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colv.translatesAutoresizingMaskIntoConstraints = false
        colv.backgroundColor = .none
        
        return colv
    }()
    
    //MARK: setup methods
    func setupCellView(){
        setupCollectionView()
    }
    
    func setupCollectionView() {
        addCollectionView()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(EmptyFeedCell.self, forCellWithReuseIdentifier: "emptycellid")
        myCollectionView.register(HomeFeedFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "homefeedfooterid")
        
        myCollectionView.bounces = false
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func addCollectionView(){
        self.addSubview(myCollectionView)
        
        myCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
    
    
    //MARK: collection view methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }//end numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "emptycellid", for: indexPath) as! EmptyFeedCell
        
        return cell
    }//end cellForItemAt
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.width, height: 220)
    }//end method
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //print("CellToBeDisplayed: \(indexPath.item)")
    }//end method
    
    
    
    //MARK: footer methods
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = myCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "homefeedfooterid", for: indexPath) as! HomeFeedFooter
        
        return footer
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: footerHeight)
    }
    
    
}//end class





class HomeFeedFooter: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFooterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: footer properties
    let loadingIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.color = .red
        
        return ai
    }()
    
    //MARK: footer setup methods
    func setupFooterView(){
        self.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        loadingIndicator.startAnimating()
    }
    
    func startLoadingIndicator(){
        loadingIndicator.startAnimating()
    }
    func stopLoadingIndicator(){
        loadingIndicator.stopAnimating()
    }
    
}//end class



















































