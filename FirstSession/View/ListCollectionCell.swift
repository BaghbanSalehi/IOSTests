//
//  ListCollectionCell.swift
//  FirstSession
//
//  Created by Shayan on 9/30/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit

let viewModel = CellViewModel()
var gameImage = UIImageView()
var gameName = UILabel()
var charactrisctic = UILabel()
var innerStackView = UIStackView()
var outerStackView = UIStackView()



class ListCollectionCell: UICollectionViewCell {
    
    let viewModel = CellViewModel()
    var gameImage = UIImageView()
    var gameName = UILabel()
    var charactrisctic = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gameImage.clipsToBounds = true
        gameImage.contentMode = .scaleToFill
        gameImage.layer.cornerRadius = 15
        gameImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
        gameName.font = UIFont.boldSystemFont(ofSize: 20)
      
        innerStackView = UIStackView(arrangedSubviews: [gameName, charactrisctic])
        innerStackView.axis = .vertical
        
        outerStackView = UIStackView(arrangedSubviews: [gameImage, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        outerStackView.spacing = 10
        contentView.addSubview(outerStackView)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfig(_ game : Game){
        viewModel.game = game
        gameImage.image = UIImage(named: viewModel.getImage())
        gameName.text = viewModel.getTitle()
        charactrisctic.text = viewModel.getCharacter()
        
    }
    
    func setupConstraints(){
        outerStackView.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        gameImage.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
    }
    
}
