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


class DetailViewController: UIViewController{
    
    
    
    var videoPlayerHolder : UIView!
    var titleLabel : UILabel!
    var characteristicLabel : UILabel!
    var developersLabel : UILabel!
    var publisherLabel : UILabel!
    var moreInfoLable: UILabel!
    var goToStoreButton: UIButton!
    var describText : UITextView!
    var rateLabel : UILabel!
    var player = AVPlayer()
    let playerController = AVPlayerViewController()
    let screenSize = UIScreen.main.bounds
   
   
    
    
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = false
               
     
        navigationController?.setNavigationBarHidden(true, animated: true)
        videoPlayerHolder = UIView(frame: .zero)
        view.addSubview(videoPlayerHolder)
        
    
        
        playerController.view.frame = videoPlayerHolder.bounds
        videoPlayerHolder.addSubview(playerController.view)
        self.addChild(playerController) 
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        describText = UITextView(frame: .zero)
        describText.isEditable = false
        describText.font = .systemFont(ofSize: 18)
        view.addSubview(describText)
        
        characteristicLabel = UILabel(frame: .zero)
        characteristicLabel.lineBreakMode = .byWordWrapping
        characteristicLabel.numberOfLines = 0
        view.addSubview(characteristicLabel)
        
        developersLabel = UILabel(frame: .zero)
        view.addSubview(developersLabel)
        
        publisherLabel = UILabel(frame: .zero)
        view.addSubview(publisherLabel)
        
        moreInfoLable = UILabel(frame: .zero)
        moreInfoLable.lineBreakMode = .byWordWrapping
        moreInfoLable.numberOfLines = 0
        view.addSubview(moreInfoLable)
        
        goToStoreButton = UIButton(frame: .zero)
        goToStoreButton.backgroundColor = UIColor(hexString: "#00CDCD")
        goToStoreButton.setTitleColor(.black, for: .normal)
        view.addSubview(goToStoreButton)
        
        rateLabel = UILabel(frame: .zero)
        rateLabel.textColor = .white
        videoPlayerHolder.addSubview(rateLabel)
        
        setupConstraint()
        config()

        
        
    }

   
  
    
    func setupConstraint(){
        
        videoPlayerHolder.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.25)
            
        }
        rateLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(20)
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
        }
        
        publisherLabel.snp.makeConstraints{
            $0.top.equalTo(developersLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
        
        moreInfoLable.snp.makeConstraints{
            $0.top.equalTo(publisherLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        goToStoreButton.snp.makeConstraints{
            $0.top.equalTo(moreInfoLable.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            
            
        }
        
        
        
    }
    
    
    
    func config(){
       
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
        goToStoreButton.addTarget(self, action: #selector(goToStoreButtonPressed), for: .touchUpInside)
     
        
    }
    @objc func goToStoreButtonPressed(){
        UIApplication.shared.open(URL(string: viewModel.getUrl())!)
    }
    

//     func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//         let tabBarIndex = tabBarController.selectedIndex
//         if tabBarIndex == 0 {
//             print("tabBarItem Selected")
//         }
//     }
    
    
}
