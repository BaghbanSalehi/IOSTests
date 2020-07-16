//
//  CellViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/16/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class CellViewModel {
    
    func getTitle(film : FilmDataModel) -> String{
        return "\(film.name)(\(film.year))"
    }
    func getRate(film : FilmDataModel) -> String {
        return "\(film.rate)/10"
    }
    func getCast(film : FilmDataModel) -> String {
        var cast = ""
        for i in film.cast{
           cast += "\(i.name), "
            
        }
        return cast
    }
    
}
