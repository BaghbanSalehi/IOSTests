//
//  CircleCollectionCell.swift
//  FirstSession
//
//  Created by Shayan on 9/9/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit

class CircleCollectionCell: UICollectionViewCell {
    
    let viewModel = CellViewModel()
    
   var gameImage = UIImageView()
    
       let screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        gameImage = UIImageView(frame: .zero)
        gameImage.clipsToBounds = true
        gameImage.contentMode = .scaleToFill
        gameImage.layer.masksToBounds = true
        gameImage.layer.cornerRadius = screenSize.height * 0.09 / 2
        contentView.addSubview(gameImage)
       
        
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
          
          
          
      }
    
}
