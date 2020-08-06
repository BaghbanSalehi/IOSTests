//
//  ViewController.swift
//  FirstSession
//
//  Created by Shayan on 6/17/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit



class GamesListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let viewModel = GameViewModel()
    let customCell = CustomCell()
    
    var selectedFilm : Game?


    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        setupTable()
        
    
        
        
        
        
    }
    
    func setupTable(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0).isActive = true
        tableView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0).isActive = true
        tableView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0).isActive = true
        tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfGames()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        cell.nameLabel.text = viewModel.filmName(at: indexPath.row)
//        cell.rateLabel.text = "\(viewModel.filmRate(at: indexPath.row))"
        let film = viewModel.game(at: indexPath)
        cell.cellConfig(film)
        
        return cell
           
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFilm = viewModel.game(at: indexPath)
        let detailViewController = DetailViewController()
        detailViewController.viewModel.game = selectedFilm
        present(detailViewController, animated: true)
            
        
      
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
