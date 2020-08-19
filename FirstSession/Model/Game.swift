//
//  DataModel.swift
//  FirstSession
//
//  Created by Shayan on 7/13/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import RealmSwift

class Game   {
    
    var name = String()
    var characteristics = String()
    var summary = String()
    var developer = Company()
    var publisher = Company()
    var year = String()
    var rate = Int()
    var imageName = String()
    var url = String()
    var videoUrl = String()
    
    
    
    
}
class GameObject : Object  {
    
    @objc dynamic var name = String()
    @objc dynamic var characteristics = String()
    @objc dynamic  var summary = String()
    @objc dynamic var developer : CompanyObject?
    @objc dynamic  var publisher : CompanyObject?
    @objc dynamic  var year = String()
    @objc dynamic  var rate = Int()
    @objc dynamic  var imageName = String()
    @objc dynamic  var url = String()
    @objc dynamic   var videoUrl = String()
    
    
    
    
}
