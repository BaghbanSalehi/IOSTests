//
//  OptionCell.swift
//  FirstSession
//
//  Created by Shayan on 9/15/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {
    
    var pic = UIImageView()
    var label = UILabel()
    
    var viewModel = OptionCellViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "optionCell")
        
        pic = UIImageView()
    
           pic.contentMode = .scaleAspectFit
           pic.clipsToBounds = true
           contentView.addSubview(pic)
           
           label = UILabel()
           contentView.addSubview(label)
           
           setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        pic.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview()
        }
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(pic.snp.trailing).offset(10)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    func config(option : Option){
        viewModel.option = option
        pic.image = UIImage(named: viewModel.getImageName())
        label.text = viewModel.getLableText()
    }
    
}
