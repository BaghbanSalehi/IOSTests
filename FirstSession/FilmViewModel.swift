//
//  FilmViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/14/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class FilmViewModel {
    
    private var array : [FilmDataModel]
    
    init() {
        array = [FilmDataModel(name : "Bad Boys", rate: 10),FilmDataModel(name: "Resident Evil", rate: 7),FilmDataModel(name: "Iron man", rate: 9)]
    }
    
    func filmName(at index : Int) -> String {
        return array[index].name
    }
    
    func filmRate(at index : Int) -> Int {
        return array[index].rate
    }
    
    func numberOfFilms() -> Int {
        return array.count
    }
    
    
    
    
}
