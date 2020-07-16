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
        array = [FilmDataModel(name : "Bad Boys", director: "Shayan", cast: [ActorDataModel(name:"Will Smith"),ActorDataModel(name: "Martin Lawrence"),ActorDataModel(name: "Miss Someone")], year: "2020", rate: 10),
                 FilmDataModel(name: "Resident Evil", director: "Shayan", cast: [ActorDataModel(name: "Mr Someone"),ActorDataModel(name: "Miss Someone"),ActorDataModel(name: "Miss Someone")], year: "1992", rate: 7),
                 FilmDataModel(name: "Iron man", director: "Shayan", cast: [ActorDataModel(name: "Mr Someone"),ActorDataModel(name: "Miss Someone"),ActorDataModel(name: "Miss Someone")], year: "2003", rate: 9)]
    }
    
    func film(at index : IndexPath) -> FilmDataModel {
        return array[index.row]
    }
    
    func numberOfFilms() -> Int {
        return array.count
    }
    
    
    
    
}
