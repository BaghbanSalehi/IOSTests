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
    
    var array = [Game]()
    private var searchArray = [Game]()
 
    var size = Int()
    
    

    
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
