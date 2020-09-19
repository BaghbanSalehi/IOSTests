//
//  WishListViewController.swift
//  FirstSession
//
//  Created by Shayan on 8/18/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SwipeCellKit
import RealmSwift
import LTMorphingLabel
import SnapKit

class WishListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SwipeTableViewCellDelegate {
    
    let viewModel = WishListViewModel()
    let customCell = CustomCell()
    var selectedGame : Game?
    var tabbar = UITabBar()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.viewControllers.remove(at: x)
        view.backgroundColor = .white
        viewModel.loadGames()
        viewModel.dbToArray()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        
        tabbar.delegate = self
        view.addSubview(tabbar)
        view.addSubview(tableView)
        setupConstraints()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        let titleLable = LTMorphingLabel()
        titleLable.text = "WishList"
        titleLable.font = UIFont(name: "OldLondon", size: 40)
        titleLable.morphingEffect = .sparkle
        titleLable.morphingDuration = 2
        navigationItem.titleView = titleLable
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       
    }
  
    func setupConstraints()  {
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(tabbar.snp.top)
        }
        
        tabbar.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.trailing.leading.equalToSuperview()
        }
        
    }
    
    func config()  {
        let goHome = UITabBarItem(title: "", image: UIImage(named: "house"), tag: 0)
        let goWish = UITabBarItem(title: "", image: UIImage(named: "wish"), tag: 1)
        let goDetail = UITabBarItem(title: "", image: UIImage(named: "detail"), tag: 2)
        tabbar.items = [goHome,goDetail,goWish]
        tabbar.selectedItem = goWish
        
        let perviousViewNumber = (navigationController?.viewControllers.count)! - 2
        if perviousViewNumber > 0 {
            navigationController?.viewControllers.remove(at: perviousViewNumber)
        }
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfGames()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.selectionStyle = .none
        cell.delegate = self
        
        
        let game = viewModel.gameAt(at: indexPath)
        cell.cellConfigGameObject(game)
        
        return cell
        
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = viewModel.game(at: indexPath)
        let detailViewController = DetailViewController()
        detailViewController.viewModel.game = selectedGame
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            self.updateModel(at: indexPath)
        }
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel (at indexPath : IndexPath)
    {
        viewModel.deleteGameAt(at: indexPath)
  
        
    }
    
}
extension WishListViewController : UITabBarControllerDelegate,UITabBarDelegate
{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         if item.tag == 0 {
             self.dismiss(animated: true, completion: nil)
             
             navigationController?.popToRootViewController(animated: true)
        
         }
         else if item.tag == 2 {
            let detailVC = DetailViewController()
            if let game = viewModel.game{
                detailVC.viewModel.game = game
            }
             navigationController?.pushViewController(detailVC, animated: true)
         }

    }
}

