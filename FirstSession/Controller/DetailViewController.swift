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
    var describText : UITextView!
    var castLabel : UILabel!
    var directorLabel : UILabel!
    var rateLabel : UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        image = UIImageView(frame: .zero)
        //image.contentMode = .scaleAspectFill
        view.addSubview(image)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        describText = UITextView(frame: .zero)
        view.addSubview(describText)
        
        castLabel = UILabel(frame: .zero)
        view.addSubview(castLabel)
        
        directorLabel = UILabel(frame: .zero)
        view.addSubview(directorLabel)
        
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
        
        describText.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(80)
        }
        
        castLabel.snp.makeConstraints{
            $0.top.equalTo(describText.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        directorLabel.snp.makeConstraints{
            $0.top.equalTo(castLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
        
        
        
    }
    
    
    
    func config(){
      
        image.image = UIImage(named: viewModel.getImage())
        rateLabel.text = viewModel.getRate()
        titleLabel.text = viewModel.getTitle()
        describText.text = viewModel.getSummary()
//        castLabel.text = viewModel.getCast()
//        directorLabel.text = viewModel.getDirector()
        
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
