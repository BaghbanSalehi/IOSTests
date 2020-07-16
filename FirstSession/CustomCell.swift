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
    var rateLabel : UILabel!
    var castLabel : UILabel!
    
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
        
        rateLabel = UILabel(frame: CGRect.zero)
        rateLabel.textAlignment = .left
        rateLabel.textColor = .blue
        rateLabel.font = rateLabel.font.withSize(12)
        background.addSubview(rateLabel)
        
        castLabel = UILabel(frame: .zero)
        castLabel.textAlignment = .left
        castLabel.textColor = .purple
        castLabel.lineBreakMode = .byWordWrapping
        castLabel.numberOfLines = 0
        background.addSubview(castLabel)
        
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
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(rateLabel.snp.leading)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(50)
        }
        
        rateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(nameLabel.snp.trailing)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
//        rateLabel.translatesAutoresizingMaskIntoConstraints = false
//        rateLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 0).isActive = true
//        rateLabel.leftAnchor.constraint(equalToSystemSpacingAfter: nameLabel.rightAnchor, multiplier: 0).isActive = true
//        rateLabel.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: 0).isActive = true
//        rateLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0).isActive = true
        
        castLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-40)
        }
        
    }
    
    
    func cellConfig(_ film : FilmDataModel){
        nameLabel.text = viewModel.getTitle(film: film)
        rateLabel.text = viewModel.getRate(film: film)
        castLabel.text = viewModel.getCast(film: film)
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
