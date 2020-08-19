//
//  Actor.swift
//  FirstSession
//
//  Created by Shayan on 7/16/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
import RealmSwift
class Company  {
    
    var name = String()
}
class CompanyObject : Object {
    
    @objc dynamic var name = String()
}
