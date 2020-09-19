//
//  DataViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/23/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import RealmSwift

class DetailViewModel {
    
    var game : Game?
    let realm = try! Realm()
    var storedGames : Results<GameObject>?
    
    
    func getTitle() -> String{
        guard let game = game else{
            return ""
        }
        return "\(game.name)(\(game.year))"
    }
    func getRate() -> String {
        guard let game = game else{
            return ""
        }
        
        return "PcGamer rate : \(game.rate)/10"
    }
    func getDevelopers() -> String {
        guard let game = game else{
            return ""
        }
        
        return "Developer : \(game.developer.name)"
    }
    
    func getSummary() -> String {
        guard let game = game else{
            return ""
        }
        
        return game.summary
    }
    
    func getPublisher() -> String {
        guard let game = game else{
            return ""
        }
        
        return "Publisher : \(game.publisher.name)"
    }
    func getImage() -> String {
        guard let game = game else{
            return ""
        }
        return game.imageName
        
    }
    
    func getCharacteristics() -> String {
        guard let game = game else{
            return ""
        }
        
        return game.characteristics
    }
    func getUrl() -> String {
        guard let game = game else{
            return ""
        }
        
        return game.url
    }
    
    func getVideoUrl() -> URL {
        guard let game = game else{
            return URL(string: "www.apple.com")!
        }
        if let videoUrl = URL(string: game.videoUrl){
        return videoUrl
        }else{
            return URL(string: "www.apple.com")!
        }
    }
    
 
    func writeData()  {
        guard let game = game else{
            return
        }
        
        do {
            try self.realm.write {
                
                let newItem = GameObject()
                let developer = CompanyObject()
                let publisher = CompanyObject()
                developer.name = game.developer.name
                publisher.name = game.publisher.name
                newItem.name = game.name
                newItem.characteristics = game.characteristics
                newItem.year = game.year
                newItem.summary = game.summary
                newItem.developer = developer
                newItem.publisher = publisher
                newItem.imageName = game.imageName
                newItem.rate = game.rate
                newItem.url = game.url
                newItem.videoUrl = game.videoUrl
                
                realm.add(newItem)
                print("\(newItem.name) added")
                
            }
        }catch{
            print("error writing data")
        }
        
    }
    
    func loadData()  {
        storedGames = realm.objects(GameObject.self)
    }
    
    func alreadyInWishList() -> Bool  {
        if let games = storedGames{
           
            for i in 0..<games.count{
                if games[i].name == game?.name{
                    return true
                }
            
        }
    }
        return false
    }
    
}

