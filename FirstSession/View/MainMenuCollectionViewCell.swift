//
//  MainMenuCollectionViewCell.swift
//  FirstSession
//
//  Created by Shayan on 9/10/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    
    let viewModel = CellViewModel()
    var gameImage = UIImageView()
    var gameName = UILabel()
    var charactrisctic = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gameImage = UIImageView(frame: .zero)
        gameImage.clipsToBounds = true
        gameImage.contentMode = .scaleToFill
        gameImage.layer.masksToBounds = true
        contentView.addSubview(gameImage)
        
        gameName = UILabel(frame: .zero)
        gameName.font = UIFont.boldSystemFont(ofSize: 20)
        contentView.addSubview(gameName)
        
        charactrisctic = UILabel(frame: .zero)
        contentView.addSubview(charactrisctic)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gameImage.frame = contentView.bounds
    }
    func cellConfig(_ game : Game){
        viewModel.game = game
        gameImage.image = UIImage(named: viewModel.getImage())
        gameName.text = viewModel.getTitle()
        charactrisctic.text = viewModel.getCharacter()
        
    }
    
    func setupConstraints(){
        gameName.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
        charactrisctic.snp.makeConstraints{
            $0.top.equalTo(gameName.snp.bottom)
            $0.trailing.leading.equalToSuperview()
        }
        gameImage.snp.makeConstraints{
            $0.top.equalTo(charactrisctic.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
