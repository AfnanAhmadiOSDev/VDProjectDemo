//
//  ThirdCell.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/13/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit
import AVFoundation

class DownloadUrlCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: properties
    let container: UIView = {
        let vi = UIView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.backgroundColor = .white
        vi.layer.cornerRadius = 5.0
        
        return vi
    }()
    let urlInputTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 13)
        
        return tf
    }()
    let myWebView: UIWebView = {
        let webv = UIWebView()
        webv.translatesAutoresizingMaskIntoConstraints = false
        webv.backgroundColor = .red
        
        return webv
    }()
    let videoLoadingIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.color = .green
        
        return ai
    }()
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "dummyimg"), for: .normal)
        button.addTarget(self, action: #selector(handleSearchBtnTap), for: .touchUpInside)
        
        return button
    }()
    let downloadBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "dummyimg"), for: .normal)
        button.isUserInteractionEnabled = false
        button.alpha = 0.3
        
        return button
    }()
    let downloadProgressCountLB: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    
    
    
    
    //MARK: setup methods
    func setupCellView(){
        setupContainer()
        
        addUrlTFAndBtn()
    }
    func setupContainer(){
        self.addSubview(container)
        
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -55).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
    
    func addUrlTFAndBtn(){
        urlInputTF.delegate = self
        container.addSubview(urlInputTF)
        container.addSubview(searchButton)
        
        searchButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        urlInputTF.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        urlInputTF.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        urlInputTF.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: 0).isActive = true
        urlInputTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func addWebView(){
        container.addSubview(myWebView)
        myWebView.topAnchor.constraint(equalTo: urlInputTF.bottomAnchor, constant: 5).isActive = true
        myWebView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        myWebView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0).isActive = true
        myWebView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
    }
    
    
    //MARK: handler methods
    @objc func handleSearchBtnTap(){
        print("in url search button tap")
        if let urlString = urlInputTF.text {
            print(urlString)
        }
        else {
            print("Invalid input")
        }
    }//end method
    
}//end class





























