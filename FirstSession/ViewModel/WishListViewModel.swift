//
//  WishListViewModel.swift
//  FirstSession
//
//  Created by Shayan on 8/18/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import RealmSwift
class WishListViewModel {
    
    let realm = try! Realm()
    var storedGames : Results<GameObject>?
    var array = [Game]()
    var game : Game?
    
    func loadGames()  {
        storedGames = realm.objects(GameObject.self)
        
        realm.refresh()
        
    }
    
    func gameAt(at index : IndexPath) -> GameObject {
        
        return storedGames![index.row] 
        
        
    }
    
    
    
    func numberOfGames() -> Int {
        
        return storedGames?.count ?? 0
        
        
    }
    
    func deleteGameAt(at index : IndexPath) {
        if let gamedeletion = self.storedGames?[index.row] {
        do {
            try self.realm.write {
                self.realm.delete(gamedeletion)
                
            }
        }catch{
            print("error deleting")
        }
    }
    }
    
    func dbToArray()  {
        if let games = storedGames{
            
            for i in 0..<games.count{
                let game = Game()
                game.name = games[i].name
                game.year = games[i].year
                game.characteristics = games[i].characteristics
                game.summary = games[i].summary
                game.developer.name = games[i].developer!.name
                game.publisher.name = games[i].publisher!.name
                game.videoUrl = games[i].videoUrl
                game.url = games[i].url
                game.rate = games[i].rate
                array.append(game)
            }
        }
    }
    func game(at index : IndexPath) -> Game {
        return array[index.row]
    }
    
    
    
    
    
}
