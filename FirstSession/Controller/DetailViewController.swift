//
//  DataViewController.swift
//  FirstSession
//
//  Created by Shayan on 7/23/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit


class DetailViewController: UIViewController {

    
    
    var image : UIImageView!
    var titleLabel : UILabel!
    var characteristicLabel : UILabel!
    var developersLabel : UILabel!
    var publisherLabel : UILabel!
    var moreInfoLable: UILabel!
    var goToStoreButton: UIButton!
    var describText : UITextView!
    var rateLabel : UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        view.addSubview(image)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        describText = UITextView(frame: .zero)
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
        view.addSubview(moreInfoLable)
        
        goToStoreButton = UIButton(frame: .zero)
        view.addSubview(goToStoreButton)
        
        rateLabel = UILabel(frame: .zero)
        rateLabel.textColor = .white
        image.addSubview(rateLabel)
        
        setupConstraint()
        config()
        
        
        
    }
    
    func setupConstraint(){
        
        image.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(200)
        }
        rateLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(image.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
        
        }
        
        characteristicLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
        describText.snp.makeConstraints{
            $0.top.equalTo(characteristicLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(80)
        }
        
        developersLabel.snp.makeConstraints{
            $0.top.equalTo(describText.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        publisherLabel.snp.makeConstraints{
            $0.top.equalTo(developersLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
        
        
        
    }
    
    
    
    func config(){
      
        image.image = UIImage(named: viewModel.getImage())
        rateLabel.text = viewModel.getRate()
        titleLabel.text = viewModel.getTitle()
        describText.text = viewModel.getSummary()
        characteristicLabel.text = viewModel.getCharacteristics()
        developersLabel.text = viewModel.getDevelopers()
        publisherLabel.text = viewModel.getPublisher()
        

        
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
