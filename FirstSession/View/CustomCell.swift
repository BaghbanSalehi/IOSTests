//
//  CellTableViewCell.swift
//  FirstSession
//
//  Created by Shayan on 7/9/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    let padding: CGFloat = 5
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
        background.backgroundColor = .white
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        background.addSubview(nameLabel)
        
        characteristicLabel = UILabel(frame: .zero)
        characteristicLabel.textAlignment = .left
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
       
//        rateLabel.frame = CGRect(x: padding, y: (frame.height-25)/2, width: 40, height: 25)
//        nameLabel.frame = CGRect(x: rateLabel.frame.height + 10, y: 0, width: frame.width, height: frame.height)
    }
    
    
    func setupConstraints(){
        
        background.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 0).isActive = true
//        nameLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
//        nameLabel.rightAnchor.constraint(equalToSystemSpacingAfter: rateLabel.leftAnchor, multiplier: 0).isActive = true
//        nameLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0).isActive = true
        
        pic.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
            
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
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
