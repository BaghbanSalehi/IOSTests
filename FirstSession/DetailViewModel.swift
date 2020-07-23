//
//  DataViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/23/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var film : FilmDataModel?
    
    
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
    func getCast() -> String {
        guard let film = film else{
            return ""
        }

        var cast = ""
        for i in film.cast{
            cast += "\(i.name), "
            
        }
        return cast
    }
    
    func getSummary() -> String {
        guard let film = film else{
            return ""
        }

        return film.summary
    }
    
    func getDirector() -> String {
        guard let film = film else{
            return ""
        }

        return film.director.name
    }
    func getImage() -> String {
        guard let film = film else{
            return ""
        }
        return film.imageName

    }
    
}

