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
        array = [FilmDataModel(name : "Bad Boys", director: Person(name:"someone"), summary: "something", cast: [Person(name:"Will Smith"),Person(name: "Martin Lawrence"),Person(name: "Miss Someone")], year: "2020", rate: 10, imageName: "badboys"),
                 FilmDataModel(name: "Resident Evil", director: Person(name: "Shayan"), summary: "something", cast: [Person(name: "Mr Someone"),Person(name: "Miss Someone"),Person(name: "Miss Someone")], year: "1992", rate: 7, imageName: "badboys"),
                 FilmDataModel(name: "Iron man", director: Person(name: "Shayan"), summary: "something", cast: [Person(name: "Mr Someone"),Person(name: "Miss Someone"),Person(name: "Miss Someone")], year: "2003", rate: 9, imageName: "badboys")]
    }
    
    func film(at index : IndexPath) -> FilmDataModel {
        return array[index.row]
    }
    
    func numberOfFilms() -> Int {
        return array.count
    }
    
    
    
    
}
