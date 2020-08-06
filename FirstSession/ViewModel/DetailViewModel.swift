//
//  DataViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/23/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var game : Game?
    
    
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

        return "\(game.rate)/10"
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
    
}

