//
//  OptionCellViewModel.swift
//  FirstSession
//
//  Created by Shayan on 9/17/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation
class OptionCellViewModel {
    
    var option : Option?
    
    func getImageName() -> String{
        guard let option = option else{
            return ""
        }
        return option.picName
    }
    
    func getLableText() -> String{
        guard let option = option else{
            return ""
        }
        return option.labelText
    }
    
}
