//
//  CellViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/16/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class CellViewModel {
    
    var film : Game?
    
    func getTitle() -> String{
        guard let film = film else{
            return ""
        }
        return "\(film.name)(\(film.year))"
    }
    func getRate() -> String {
        guard let film = film else{
            return ""
        }
        return "\(film.rate)/10"
    }
//    func getCast() -> String {
//        guard let film = film else{
//            return ""
//        }
//        var cast = ""
//        for i in film.cast{
//           cast += "\(i.name), "
//            
//        }
//        return cast
//    }
    
}
