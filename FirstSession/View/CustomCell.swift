//
//  CellTableViewCell.swift
//  FirstSession
//
//  Created by Shayan on 7/9/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
import SwipeCellKit
class CustomCell: SwipeTableViewCell {
    
    var background : UIView!
    var nameLabel : UILabel!
    var characteristicLabel : UILabel!
    var pic : UIImageView!
    
    
    let viewModel = CellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        background = UIView(frame: .zero)
        contentView.addSubview(background)
        background.backgroundColor = RandomFlatColor()
        
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        nameLabel.textColor = ContrastColorOf(background.backgroundColor!, returnFlat: true)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        background.addSubview(nameLabel)
        
        characteristicLabel = UILabel(frame: .zero)
        characteristicLabel.textAlignment = .left
        characteristicLabel.textColor = ContrastColorOf(background.backgroundColor!, returnFlat: true)
        characteristicLabel.lineBreakMode = .byWordWrapping
        characteristicLabel.numberOfLines = 0
        background.addSubview(characteristicLabel)
        
        pic = UIImageView(frame: .zero)
        pic.contentMode = .scaleToFill
        pic.clipsToBounds = false
        background.addSubview(pic)
        
        
        
        setupConstraints()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func setupConstraints(){
        
        background.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            
        }
        
        pic.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().inset(5)
            $0.height.equalTo(100)
            $0.width.equalTo(80)
            //$0.bottom.equalToSuperview().inset(5)
            
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(pic.snp.trailing).offset(5)
            $0.trailing.equalToSuperview()
            
            
        }
        
        characteristicLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(pic.snp.trailing).offset(5)
            $0.trailing.equalToSuperview()
            
            
            
        }
        
        
        
        
    }
    
    
    func cellConfig(_ game : Game){
        viewModel.game = game
        nameLabel.text = viewModel.getTitle()
        characteristicLabel.text = viewModel.getCharacter()
        pic.image = UIImage(named: viewModel.getImage())
        
        
        
    }
    
    func cellConfigGameObject(_ game : GameObject){
        viewModel.gameObject = game
        nameLabel.text = viewModel.getTitleObject()
        characteristicLabel.text = viewModel.getCharacterObject()
        pic.image = UIImage(named: viewModel.getImageObject())
        
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
