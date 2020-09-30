//
//  ListTableViewCell.swift
//  FirstSession
//
//  Created by Shayan on 9/29/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit
import MSPeekCollectionViewDelegateImplementation


class ListTableViewCell: UITableViewCell {
    
    var collectionView : UICollectionView!
    var game = [Game]()
    var delegate : TableviewDelegate?
    var behavior: MSCollectionViewPeekingBehavior!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        if #available(iOS 13.0, *) {
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        } else {
            // Fallback on earlier versions
        }
        
        collectionView.register(ListCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        contentView.addSubview(collectionView)
        
        setupConstraints()
        
    }
    
    
    @available(iOS 13.0, *)
    private func createLayout() -> UICollectionViewLayout {
    //1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.33))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
    //2
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),heightDimension: .fractionalWidth(0.55))
    //3
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.interItemSpacing = .fixed(10)
    let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(15))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
   
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
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
    
}


extension ListTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
 

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionCell
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


