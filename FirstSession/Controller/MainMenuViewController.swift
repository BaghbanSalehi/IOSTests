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
import MessageUI

class MainMenuViewController: UIViewController {
    
    private var tableView = UITableView()
    private var tbView = UIView()
    private var options = UITableView()
    private var optionsView = UIView()
    private let viewModel = MainMenuViewModel()
    private let option = OptionViewModel()
    
    private var headerLabel = UILabel()
    private var headerButton = UIButton()
    private var dragImage = UIImageView()
    
    let screenSize = UIScreen.main.bounds
    
    var panGesture = UIPanGestureRecognizer()
    var optionViewInitialLocation = CGPoint()
    
    var tapGesture = UITapGestureRecognizer()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tbView = UIView()
        view.addSubview(tbView)
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainMenuCustomCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "list")
        tableView.sectionFooterHeight = 0
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        tbView.addSubview(tableView)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGuestureConfig))
        optionsView = UIView()
        optionsView.isHidden = true
        optionsView.isUserInteractionEnabled = true
        optionsView.addGestureRecognizer(panGesture)
        view.addSubview(optionsView)
        
        options = UITableView()
        options.delegate = self
        options.dataSource = self
        options.register(OptionCell.self, forCellReuseIdentifier: "optionCell")
        options.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        options.isScrollEnabled = false
        optionsView.addSubview(options)
        
        dragImage = UIImageView()
        dragImage.image = UIImage(named: "down")
        dragImage.clipsToBounds = true
        dragImage.contentMode = .scaleAspectFit
        dragImage.isUserInteractionEnabled = false
        dragImage.backgroundColor = .white
        optionsView.addSubview(dragImage)
        
        setupTableHeaderView()
        
        setupConstraints()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(showMore))
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tapGesture.isEnabled = false
        tbView.addGestureRecognizer(tapGesture)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        let titleLable = LTMorphingLabel()
        titleLable.text = "PcGamer"
        titleLable.font = UIFont(name: "OldLondon", size: 40)
        titleLable.morphingEffect = .scale
        titleLable.morphingDuration = 2
        navigationItem.titleView = titleLable
        if !optionsView.isHidden {
            hideOptionsTableView()
        }
        
    }
    
    
    
    
    func setupConstraints(){
        tbView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
           
        }
        
        optionsView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(screenSize.height * 0.7)
            $0.leading.trailing.equalToSuperview()
            //$0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.bottom.equalToSuperview()
            
        }
        
        dragImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            
            
        }
        
        options.snp.makeConstraints{
            $0.top.equalTo(dragImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            // $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.bottom.equalToSuperview()
            
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
                self.tapGesture.isEnabled = true
                
                
                
            }, completion: nil)
            
        }
        else{
            hideOptionsTableView()
            
        }
        
    }
    
    @objc func panGuestureConfig(_ sender:UIPanGestureRecognizer){
        
        let translation = sender.translation(in: self.view)
        
        if sender.state == .began{
            optionViewInitialLocation = optionsView.center
        }
        else if sender.state == .changed{
            if optionsView.center.y < 900 && optionsView.center.y >= optionViewInitialLocation.y {
                optionsView.center.y += translation.y
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
            
        }
        else if sender.state == .ended{
            
            if optionsView.center.y > screenSize.height * 0.95 {
                hideOptionsTableView()
            }
            else{
                optionsView.center.y = optionViewInitialLocation.y
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
        }
        
        
    }
    
    @objc func tableViewTapped(){
        hideOptionsTableView()
        tapGesture.isEnabled = false
    }
    
    func hideOptionsTableView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.optionsView.center.y = 999
            self.tableView.alpha = 1
            self.tableView.isUserInteractionEnabled = true
            
        }) { (finished) in
            if finished{
                self.optionsView.isHidden = true
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
        return 1
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
            return 70
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return 1
        }
    
        return 2
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            if indexPath.section == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! ListTableViewCell
                cell.delegate = self
                cell.collectionView.tag = indexPath.section
                let game = viewModel.gameAt(at: indexPath.section)
                cell.cellConfig(game)
                return cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainMenuCustomCell
            cell.delegate = self
            cell.collectionView.tag = indexPath.section
            let game = viewModel.gameAt(at: indexPath.section)
            cell.cellConfig(game)
            return cell
            }
           
        }
        else if tableView == options {
            let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath) as! OptionCell
            cell.selectionStyle = .none
            let option = self.option.optionAt(index: indexPath)
            cell.config(option: option)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView{
            if indexPath.section == 4 {
                        return 250
                    }
            return 200
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(WishListViewController(), animated: true)
        }
        else
        {
            sendEmail()
        }
    }
    func cellTapped(at section : Int, row : Int) {
        let vc = DetailViewController()
        let selectedGame = viewModel.selectGame(at: section, row: row)
        vc.viewModel.game = selectedGame
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func moreGames(sender : UIButton){
        let vc = GamesListViewController()
        let selectedCategory = viewModel.gameAt(at: sender.tag)
        vc.viewModel.array = selectedCategory
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension MainMenuViewController : MFMailComposeViewControllerDelegate
{
    func sendEmail() {
        if MFMailComposeViewController.canSendMail(){
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setToRecipients(["software.developer.bsalehi@gmail.com"])
            mailVC.setMessageBody("PcGamer is awesome", isHTML: false)
            self.present(mailVC, animated: true, completion: nil)
        }
        else
        {
            let failAlert = UIAlertController(title: "Error", message: "Mail services are not available in your device ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            failAlert.addAction(ok)
            self.present(failAlert,animated: true)
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        if result.rawValue == MFMailComposeResult.sent.rawValue {
            let noticeAlert = UIAlertController(title: "Your message has been sent", message: "Thank you for contacting us.We will reach you within 24 hours. ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            noticeAlert.addAction(ok)
            self.present(noticeAlert,animated: true)
        }
        
    }
}


