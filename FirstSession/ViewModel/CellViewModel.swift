//
//  CellViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/16/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class CellViewModel {
    
    var game : Game?
    var gameObject : GameObject?
    
    func getTitle() -> String{
        guard let game = game else{
            return ""
        }
        return "\(game.name)"
    }
    
    func getCharacter() -> String{
        guard let game = game else{
            return ""
        }
        return "\(game.characteristics)"
    }
    
    func getImage() -> String {
        guard let game = game else{
            return ""
        }
        return game.imageName

    }
    
    func getTitleObject() -> String{
         guard let game = gameObject else{
             return ""
         }
         return "\(game.name)"
     }
     
     func getCharacterObject() -> String{
         guard let game = gameObject else{
             return ""
         }
         return "\(game.characteristics)"
     }
     
     func getImageObject() -> String {
         guard let game = gameObject else{
             return ""
         }
         return game.imageName

     }
    

    
}
