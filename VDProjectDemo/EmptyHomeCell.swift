//
//  EmptyHomeCell.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/15/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit


class EmptyFeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupEmptyCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: empty cell properties
    let noDataLB: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Data Available"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    
    //MARK: empty cell setup methods
    func setupEmptyCell(){
        self.addSubview(noDataLB)
        noDataLB.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        noDataLB.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    
}//end class




























