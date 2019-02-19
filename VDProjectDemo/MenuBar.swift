//
//  MenuBar.swift
//  VideoDownloaderApp
//
//  Created by Ali Apple on 2/13/19.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

let menuIconsList = [#imageLiteral(resourceName: "dummyimg"),#imageLiteral(resourceName: "dummyimg"),#imageLiteral(resourceName: "dummyimg"),#imageLiteral(resourceName: "dummyimg")]

class MyMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    //MARK: overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        setupMenuCollectionView()
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
//        let indexPath = IndexPath(item: 0, section: 0)
//        btnCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: properties
    var menuBtnDelegateObj: MenuBTnClickDelegate?
    
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let colv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colv.translatesAutoresizingMaskIntoConstraints = false
        colv.backgroundColor = .none
        
        return colv
    }()
    
    
    
    
    //MARK: collectionview methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "menuCellid", for: indexPath) as! MenuButtonsCell
        cell.buttonIconIV.image = menuIconsList[indexPath.item]
        cell.menuButton.tag = indexPath.item
        cell.menuButton.addTarget(self, action: #selector(handleMenuBtnTap), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / CGFloat(numberOfCells)), height: self.frame.height)
    }
    
    
    
    
    //MARK: setup methods
    func setupMenuCollectionView(){
        addMenuCollectionView()
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(MenuButtonsCell.self, forCellWithReuseIdentifier: "menuCellid")
        
        menuCollectionView.bounces = false
        menuCollectionView.showsVerticalScrollIndicator = false
        menuCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func addMenuCollectionView(){
        self.addSubview(menuCollectionView)
        menuCollectionView.backgroundColor = .green
        menuCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    //
    @objc func handleMenuBtnTap(sender: UIButton){
        print("hello")
        menuBtnDelegateObj?.menuBtnPressed(buttonId: sender.tag)
    }
    
    
}//end class





class MenuButtonsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMenuCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: cell properties
    let buttonIconIV: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "dummyimg"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    //MARK: cell setup methods
    func setupMenuCellView(){
        addBtnIcon()
        addMenuBtn()
    }
    func addBtnIcon(){
        self.addSubview(buttonIconIV)
        buttonIconIV.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        buttonIconIV.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        buttonIconIV.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonIconIV.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func addMenuBtn(){
        self.addSubview(menuButton)
        menuButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    
}//end class




























