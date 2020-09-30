//
//  MainMenuViewModel.swift
//  FirstSession
//
//  Created by Shayan on 9/12/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import SwiftyJSON



class MainMenuViewModel {
    
    private var array = [[Game]]()
    private var temp = [Game]()
    private var headerTitleArray = ["Games we love","RPG","Racing","FPS","Don't miss them"]
    var size = Int()
    
    
    init() {
        
        getGames(resource: "gamesList")
        getGames(resource: "Rpg")
        getGames(resource: "Racing")
        getGames(resource: "fps")
        getGames(resource: "missed")
        
    }
    
    func getGames(resource: String) {
        
        if let path = Bundle.main.path(forResource: resource , ofType: "json"){
            
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
            
            temp.append(game)
            
            
        }
        
        array.append(temp)
        
        temp.removeAll()
        
    }
    
    func gameAt(at index : Int) -> [Game] {
        
        return array[index]
        
    }
    
    func selectGame(at section : Int, row : Int) -> Game {
        
        return array[section][row]
        
    }
    
    func numberOfGames() -> Int {
        
        return array.count
        
    }
    
    func gamesArray() -> [[Game]] {
        return array
    }
    
    func headerTitle(at section : Int) -> String {
        return headerTitleArray[section]
    }
    
    
}
