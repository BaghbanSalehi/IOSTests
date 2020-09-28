//
//  ViewController.swift
//  FirstSession
//
//  Created by Shayan on 6/17/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import LTMorphingLabel
import RealmSwift




class GamesListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    let viewModel = GameViewModel()
    let customCell = CustomCell()
    var selectedGame : Game?
    let searchBar = UISearchBar()
    
    let tableView = UITableView()
    var collectionView : UICollectionView!
    
    
    let screenSize = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        
        

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        layout.itemSize = CGSize(width: screenSize.height * 0.09, height: screenSize.height * 0.09)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CircleCollectionCell.self, forCellWithReuseIdentifier: "cell")
        
        
        
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "wish"), style: .plain, target: self, action: #selector(goToWishList))
        
        setupConstraints()
        
   
        
    }
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.title = ""
        let titleLable = LTMorphingLabel()
        titleLable.text = "Games list"
        titleLable.font = UIFont(name: "OldLondon", size: 40)
        titleLable.morphingEffect = .pixelate
        titleLable.morphingDuration = 2
        navigationItem.titleView = titleLable
    }
    
  
    
    func setupConstraints(){
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: searchBar.bottomAnchor, multiplier: 0).isActive = true
        tableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0).isActive = true
        tableView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0).isActive = true
        tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 0).isActive = true
        searchBar.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0).isActive = true
        searchBar.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0).isActive = true
        searchBar.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.topAnchor, multiplier: 0).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0).isActive = true
        collectionView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0).isActive = true
        collectionView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalToSystemSpacingBelow: searchBar.topAnchor, multiplier: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.1).isActive = true
        

        
        
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfSearchedGames() != 0 {
            return viewModel.numberOfSearchedGames()
        }else{
            return viewModel.numberOfGames()
        }
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.selectionStyle = .none
        
        if viewModel.numberOfSearchedGames() != 0{
            let searchedGame = viewModel.searchedGameAt(at: indexPath)
            cell.cellConfig(searchedGame)
            return cell
        }else{
            let game = viewModel.gameAt(at: indexPath)
            cell.cellConfig(game)
            
            
            
            return cell
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.numberOfSearchedGames() != 0 {
            selectedGame = viewModel.searchedGameAt(at: indexPath)
        }else{
            selectedGame = viewModel.gameAt(at: indexPath)
        }
        let detailViewController = DetailViewController()
        detailViewController.viewModel.game = selectedGame
        // searchBar.searchTextField.endEditing(true) // for sake of ios 12 users can't touch searchbar textfield.
        DispatchQueue.main.async {
            self.searchBar.resignFirstResponder()
        }
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 110
    //    }
    //
    
    
    @objc func goToWishList()  {
        navigationController?.pushViewController(WishListViewController(), animated: true)
    }
    
    
}
extension GamesListViewController : UISearchBarDelegate
{
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var searchedGame = [Game]()
        searchedGame = viewModel.gamesArray().filter({ (game) -> Bool in
            return game.name.prefix(searchText.count) == searchText
            
        })
        viewModel.createSearchedGame(game: searchedGame)
        tableView.reloadData()
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.deleteSearchArray()
        tableView.reloadData()
        searchBar.setShowsCancelButton(false, animated: true)
        //searchBar.searchTextField.text = ""
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
}

extension GamesListViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfGames()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CircleCollectionCell
        let game = viewModel.gameAt(at: indexPath)
        cell.cellConfig(game)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedGame = viewModel.gameAt(at: indexPath)
        let detailViewController = DetailViewController()
        detailViewController.viewModel.game = selectedGame
        navigationController?.pushViewController(detailViewController, animated: true)
    }
  
    
}
