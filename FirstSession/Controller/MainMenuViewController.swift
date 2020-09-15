//
//  MainMenuViewController.swift
//  FirstSession
//
//  Created by Shayan on 9/10/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import UIKit
import SnapKit
import LTMorphingLabel

class MainMenuViewController: UIViewController {
    
    private var tableView = UITableView()
    private var options = UITableView()
    private var optionsView = UIView()
    private let viewModel = MainMenuViewModel()
    
    private var headerLabel = UILabel()
    private var headerButton = UIButton()
    
    let screenSize = UIScreen.main.bounds
    
    var panGesture = UIPanGestureRecognizer()
    var optionViewInitialLocation = CGPoint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainMenuCustomCell.self, forCellReuseIdentifier: "cell")
        tableView.sectionFooterHeight = 0
        view.addSubview(tableView)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGuestureConfig))
        optionsView = UIView()
        optionsView.isHidden = true
        optionsView.backgroundColor = .red
        optionsView.isUserInteractionEnabled = true
        optionsView.addGestureRecognizer(panGesture)
        view.addSubview(optionsView)
        
        options = UITableView(frame: .zero)
        options.delegate = self
        options.dataSource = self
        options.register(OptionCell.self, forCellReuseIdentifier: "optionCell")
        options.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        optionsView.addSubview(options)
        
        setupTableHeaderView()
        
        setupConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "wish"), style: .plain, target: self, action: #selector(showMore))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        let titleLable = LTMorphingLabel()
        titleLable.text = "PcGamer"
        titleLable.font = UIFont(name: "OldLondon", size: 40)
        titleLable.morphingEffect = .scale
        titleLable.morphingDuration = 2
        navigationItem.titleView = titleLable
        
    }
    
    
    func setupConstraints(){
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        optionsView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(screenSize.height * 0.7)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
        options.snp.makeConstraints{
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
    }
    
    func setupHeaderViewConstraints(){
        
        headerLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            
        }
        
        headerButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            
            
        }
        
        
        
    }
    
    func setupTableHeaderView(){
        let frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        let view = UIView(frame: frame)
        view.backgroundColor = .cyan
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "pc")
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        view.addSubview(image)
        tableView.tableHeaderView = view
        image.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func showMore(){
        if optionsView.isHidden {
            UIView.animate(withDuration: 0.3,delay: 0 ,options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.optionsView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                self.optionsView.layoutIfNeeded()
                self.optionsView.isHidden = false
                self.tableView.alpha = 0.5
                self.tableView.isUserInteractionEnabled = false
                
                
            }, completion: nil)
            
        }
        else{
            UIView.animate(withDuration: 0.3, animations: {
                self.optionsView.center.y += self.screenSize.height - 100
                self.tableView.alpha = 1
                self.tableView.isUserInteractionEnabled = true
                
            }) { (finished) in
                if finished{
                    self.optionsView.isHidden = true
                }
            }
            
            
            
        }
        
    }
    
    @objc func panGuestureConfig(_ sender:UIPanGestureRecognizer){
        
        let translation = sender.translation(in: self.view)
        if translation.y >= 0 {
            if sender.state == .began{
                optionViewInitialLocation = optionsView.center
            }
            else if sender.state == .changed{
                
                optionsView.center.y += translation.y
                sender.setTranslation(CGPoint.zero, in: self.view)
                
            }
            else if sender.state == .ended{
                optionsView.center.y = optionViewInitialLocation.y
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
            
        }
    }
    
    
}

extension MainMenuViewController : UITableViewDelegate,UITableViewDataSource,TableviewDelegate
{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tableView{
            return viewModel.numberOfGames()
        }
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == self.tableView {
            let view = UIView(frame: .zero)
            view.backgroundColor = .white
            headerLabel = UILabel(frame: .zero)
            headerLabel.font = UIFont(name: "CarnivaleeFreakshow", size: 25)
            headerLabel.text = viewModel.headerTitle(at: section)
            headerButton = UIButton(frame: .zero)
            headerButton.titleLabel?.font = UIFont(name: "CarnivaleeFreakshow", size: 25)
            headerButton.setTitle("View more", for: .normal)
            headerButton.setTitleColor(.blue, for: .normal)
            headerButton.addTarget(self, action: #selector(moreGames), for:.touchUpInside)
            headerButton.tag = section
            
            view.addSubview(headerLabel)
            view.addSubview(headerButton)
            
            setupHeaderViewConstraints()
            
            return view
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == self.tableView{
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainMenuCustomCell
            cell.delegate = self
            cell.collectionView.tag = indexPath.section
            let game = viewModel.gameAt(at: indexPath.section)
            cell.cellConfig(game)
            return cell
        }
        else if tableView == options {
            let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath) as! OptionCell
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView{
            return 200
        }
        return 0
    }
    func cellTapped(at section : Int, row : Int) {
        let vc = DetailViewController()
        let selectedGame = viewModel.selectGame(at: section, row: row)
        vc.viewModel.game = selectedGame
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func moreGames(sender : UIButton){
        print(sender.tag)
        let vc = GamesListViewController()
        let selectedCategory = viewModel.gameAt(at: sender.tag)
        vc.viewModel.array = selectedCategory
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


