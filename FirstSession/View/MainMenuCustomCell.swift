//
//  MainMenuCustomCell.swift
//  FirstSession
//
//  Created by Shayan on 9/10/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit
import MSPeekCollectionViewDelegateImplementation

protocol TableviewDelegate {
    func cellTapped(at section : Int, row : Int)
}

class MainMenuCustomCell: UITableViewCell {
    
    var collectionView : UICollectionView!
    var game = [Game]()
    var delegate : TableviewDelegate?
    var behavior: MSCollectionViewPeekingBehavior!
    

   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        //collectionView.isPagingEnabled = true
        behavior = MSCollectionViewPeekingBehavior()
        behavior.cellSpacing = 5
        behavior.cellPeekWidth = 10
        collectionView.configureForPeekingBehavior(behavior: behavior)
        collectionView.delegate = self
        collectionView.dataSource = self
       
        
        contentView.addSubview(collectionView)
        
        setupConstraints()
        
        
    }
    
    func setupConstraints(){
        collectionView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
         
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
  

}

extension MainMenuCustomCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainMenuCollectionViewCell
        let game = self.game[indexPath.row]
        cell.cellConfig(game)
        return cell
        
        
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.cellTapped(at: collectionView.tag, row: indexPath.row)
      

    }
    
  
    
    func cellConfig(_ game : [Game]){
        self.game = game
        collectionView.reloadData()
        
    }
    
    
}
