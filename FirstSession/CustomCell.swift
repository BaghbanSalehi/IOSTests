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
    var numberLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //background.backgroundColor = UIColor.green
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .center
        //nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
        numberLabel = UILabel(frame: CGRect.zero)
        numberLabel.textAlignment = .center
        //numberLabel.textColor = UIColor.blue
        contentView.addSubview(numberLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        numberLabel.frame = CGRect(x: padding, y: (frame.height-25)/2, width: 40, height: 25)
        nameLabel.frame = CGRect(x: numberLabel.frame.height + 10, y: 0, width: frame.width, height: frame.height)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
