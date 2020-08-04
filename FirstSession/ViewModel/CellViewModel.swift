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
    
    func getTitle() -> String{
        guard let game = game else{
            return ""
        }
        return "\(game.name)(\(game.year))"
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
    
//    func getRate() -> String {
//        guard let game = game else{
//            return ""
//        }
//        return "\(game.rate)/10"
//    }

    
}
