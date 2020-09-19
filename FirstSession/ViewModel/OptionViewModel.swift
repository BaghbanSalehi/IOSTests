//
//  OptionViewModel.swift
//  FirstSession
//
//  Created by Shayan on 9/16/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class OptionViewModel {
    
    let option = [Option(picName: "wish", labelText: "My wishlist"),Option(picName: "contact", labelText: "Contact us")]
    
    func optionAt(index : IndexPath) -> Option  {
        return option[index.row]
    }
    
   
    
    
    
    
}
