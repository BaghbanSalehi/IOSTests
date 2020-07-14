//
//  CellTableViewCell.swift
//  FirstSession
//
//  Created by Shayan on 7/9/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    let padding: CGFloat = 5
    var background : UIView!
    var nameLabel : UILabel!
    var rateLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //background.backgroundColor = UIColor.green
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        //nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
        rateLabel = UILabel(frame: CGRect.zero)
        rateLabel.textAlignment = .left
        //numberLabel.textColor = UIColor.blue
        contentView.addSubview(rateLabel)
        
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
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 2).isActive = true
        nameLabel.rightAnchor.constraint(equalToSystemSpacingAfter: rateLabel.leftAnchor, multiplier: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0).isActive = true
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 0).isActive = true
        rateLabel.leftAnchor.constraint(equalToSystemSpacingAfter: nameLabel.rightAnchor, multiplier: 0).isActive = true
        rateLabel.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: 0).isActive = true
        rateLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0).isActive = true
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
