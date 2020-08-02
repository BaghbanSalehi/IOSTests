//
//  FilmViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/14/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class GameViewModel {
    
    private var array : [Game]
    
    init() {
        array = [Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),
                 Game(name : "",genre : "",summary:"",developer:Company(name :""),publisher:Company(name:""),year:"",rate:1, imageName: ""),]
    }
    
    func film(at index : IndexPath) -> Game {
        return array[index.row]
    }
    
    func numberOfFilms() -> Int {
        return array.count
    }
    
    
    
    
}
