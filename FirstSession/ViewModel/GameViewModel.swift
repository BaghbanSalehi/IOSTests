//
//  FilmViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/14/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import SwiftyJSON



class GameViewModel {
    
    private var array = [Game]()
    private var searchArray = [Game]()
    var size = Int()
    
    
    init() {
        
        if let path = Bundle.main.path(forResource: "gamesList", ofType: "json"){
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let gameJson : JSON = JSON(jsonResult)
                size = gameJson["games"].count
                updateGameData(json: gameJson)
            } catch {
                // handle error
            }
        }
        
    }
    
    
    
    func updateGameData(json : JSON)
    {
       
        for i in 0..<size {
            
            let game = Game()
            let developer = Company()
            let publisher = Company()
            
            game.name = json["games"]["\(i)"]["name"].stringValue
            game.characteristics = json["games"]["\(i)"]["characteristics"].stringValue
            game.summary = json["games"]["\(i)"]["summary"].stringValue
            developer.name = json["games"]["\(i)"]["developer"].stringValue
            game.developer = developer
            publisher.name = json["games"]["\(i)"]["publisher"].stringValue
            game.publisher = publisher
            game.year = json["games"]["\(i)"]["year"].stringValue
            game.rate = json["games"]["\(i)"]["rate"].intValue
            game.imageName = json["games"]["\(i)"]["imageName"].stringValue
            game.url = json["games"]["\(i)"]["url"].stringValue
            game.videoUrl = json["games"]["\(i)"]["videoUrl"].stringValue
            
            array.append(game)
            
        }
        
        
        
    }
    
    func gameAt(at index : IndexPath) -> Game {
        
        return array[index.row]
        
        
    }
    
    
    
    func numberOfGames() -> Int {
        
        return array.count
        
    }
    
    func gamesArray() -> [Game] {
        return array
    }
    
    func createSearchedGame(game : [Game]) {
        searchArray = game
    }
    
    func searchedGameAt(at index : IndexPath) -> Game {
        return searchArray[index.row]
    }
    
    func numberOfSearchedGames() -> Int {
        return searchArray.count
    }
    func deleteSearchArray() {
        searchArray.removeAll()
     }
}
