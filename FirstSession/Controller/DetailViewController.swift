//
//  DataViewController.swift
//  FirstSession
//
//  Created by Shayan on 7/23/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit
import AVKit
import RealmSwift
import SafariServices

class DetailViewController: UIViewController{
    
    
    
    var videoPlayerHolder : UIView!
    var titleLabel : UILabel!
    var characteristicLabel : UILabel!
    var developersLabel : UILabel!
    var publisherLabel : UILabel!
    var moreInfoLable: UILabel!
    var goToStoreButton: UIButton!
    var wishListButoon : UIButton!
    var describText : UITextView!
    var rateLabel : UILabel!
    var player = AVPlayer()
    let playerController = AVPlayerViewController()
    let screenSize = UIScreen.main.bounds
    var tabbar = UITabBar()
    let realm = try! Realm()
    let elementColor = UIColor(hexString: "#eeeeee")
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#101010")
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        videoPlayerHolder = UIView(frame: .zero)
        view.addSubview(videoPlayerHolder)
        
        tabbar.delegate = self
        tabbar.barTintColor = UIColor(hexString: "#232b2b")
        tabbar.unselectedItemTintColor = elementColor
        view.addSubview(tabbar)
        
        playerController.view.frame = videoPlayerHolder.bounds
        videoPlayerHolder.addSubview(playerController.view)
        self.addChild(playerController) 
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = elementColor
        view.addSubview(titleLabel)
        
        describText = UITextView(frame: .zero)
        describText.isEditable = false
        describText.font = .systemFont(ofSize: 18)
        describText.backgroundColor = UIColor(hexString: "#101010")
        describText.textColor = elementColor
        view.addSubview(describText)
        
        characteristicLabel = UILabel(frame: .zero)
        characteristicLabel.lineBreakMode = .byWordWrapping
        characteristicLabel.numberOfLines = 0
        characteristicLabel.textColor = elementColor
        view.addSubview(characteristicLabel)
        
        developersLabel = UILabel(frame: .zero)
        developersLabel.textColor = elementColor
        view.addSubview(developersLabel)
        
        publisherLabel = UILabel(frame: .zero)
        publisherLabel.textColor = elementColor
        view.addSubview(publisherLabel)
        
        moreInfoLable = UILabel(frame: .zero)
        moreInfoLable.lineBreakMode = .byWordWrapping
        moreInfoLable.numberOfLines = 0
        moreInfoLable.textColor = elementColor
        view.addSubview(moreInfoLable)
        
        goToStoreButton = UIButton(frame: .zero)
        goToStoreButton.backgroundColor = UIColor(hexString: "#00CDCD")
        goToStoreButton.setTitleColor(.black, for: .normal)
        view.addSubview(goToStoreButton)
        
        rateLabel = UILabel(frame: .zero)
        rateLabel.textColor = .white
        view.addSubview(rateLabel)
        
        wishListButoon = UIButton(frame: .zero)
        wishListButoon.backgroundColor = UIColor(hexString: "#00CDCD")
        wishListButoon.setTitleColor(.black, for: .normal)
        view.addSubview(wishListButoon)
        
        setupConstraint()
        config()
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        playerController.player?.play()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    func setupConstraint(){
        tabbar.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.trailing.leading.equalToSuperview()
            
        }
        videoPlayerHolder.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.25)
            
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(videoPlayerHolder.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
            
        }
        
        characteristicLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
        describText.snp.makeConstraints{
            $0.top.equalTo(characteristicLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.10)
        }
        
        developersLabel.snp.makeConstraints{
            $0.top.equalTo(describText.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.03)
        }
        
        publisherLabel.snp.makeConstraints{
            $0.top.equalTo(developersLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.03)
            
        }
        
        rateLabel.snp.makeConstraints{
            $0.top.equalTo(publisherLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.03)
        }
        
        moreInfoLable.snp.makeConstraints{
            $0.top.equalTo(rateLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.03)
        }
        
        goToStoreButton.snp.makeConstraints{
            $0.top.equalTo(moreInfoLable.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.05)
            
            
        }
        wishListButoon.snp.makeConstraints{
            $0.top.equalTo(goToStoreButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(screenSize.height * 0.05)
            
            
            
        }
        
        
        
    }
    
    
    
    func config(){
        viewModel.loadData()
        player = AVPlayer(url: viewModel.getVideoUrl())
        playerController.player = player
        playerController.player?.play()
        rateLabel.text = viewModel.getRate()
        titleLabel.text = viewModel.getTitle()
        describText.text = viewModel.getSummary()
        characteristicLabel.text = viewModel.getCharacteristics()
        developersLabel.text = viewModel.getDevelopers()
        publisherLabel.text = viewModel.getPublisher()
        moreInfoLable.text = "Do you want to know more and buy this game?"
        goToStoreButton.setTitle("Yes,Let's go", for: .normal)
        goToStoreButton.titleLabel?.font = UIFont(name: "CarnivaleeFreakshow", size: 25)
        goToStoreButton.addTarget(self, action: #selector(goToStoreButtonPressed), for: .touchUpInside)
        
        if !viewModel.alreadyInWishList(){
            wishListButoon.setTitle("Add this to wish list", for: .normal)
            wishListButoon.titleLabel?.font = UIFont(name: "CarnivaleeFreakshow", size: 25)
            wishListButoon.addTarget(self, action: #selector(addToWishList), for: .touchUpInside)
        }else{
            wishListButoon.setTitle("In wish list", for: .normal)
            wishListButoon.isEnabled = false
            wishListButoon.setTitleColor(.gray, for: .disabled)
        }
        
        let goHome = UITabBarItem(title: "", image: UIImage(named: "house"), tag: 0)
        let goWish = UITabBarItem(title: "", image: UIImage(named: "wish"), tag: 1)
        let goDetail = UITabBarItem(title: "", image: UIImage(named: "detail"), tag: 2)
        tabbar.items = [goHome,goDetail,goWish]
        tabbar.selectedItem = goDetail
        
        
        
    }
    @objc func goToStoreButtonPressed(){
        //UIApplication.shared.open(URL(string: viewModel.getUrl())!)
        let svc = SFSafariViewController(url: URL(string: viewModel.getUrl())!)
        present(svc, animated: true, completion: nil)
        playerController.player?.pause()
        
    }
    
    @objc func addToWishList(){
        viewModel.writeData()
        wishListButoon.setTitle("Added to wish list", for: .normal)
        wishListButoon.isEnabled = false
        wishListButoon.setTitleColor(.gray, for: .disabled)
    }
    
    
    
    
    
    
}

extension DetailViewController : UITabBarControllerDelegate,UITabBarDelegate
{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            self.dismiss(animated: true, completion: nil)
            
            navigationController?.popToRootViewController(animated: true)
            
        }
        else if item.tag == 1 {
            let wishVC = WishListViewController()
            if let game = viewModel.game{
                wishVC.viewModel.game = game
            }
            navigationController?.pushViewController(wishVC, animated: true)
        }
        
    }
}
