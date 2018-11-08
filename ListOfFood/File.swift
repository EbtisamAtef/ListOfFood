//
//  File.swift
//  ListOfFood
//
//  Created by Ebtisam on 11/8/18.
//  Copyright © 2018 Ebtisam. All rights reserved.
//

import Foundation

class FoodItem {
    
    var Name : String?
    var image: String?
    var desc : String?
    
    
    
    init( Name : String ,image: String ,desc : String) {
        
        
        self.Name = Name
        self.image = image
        self.desc = desc
    }
    
}

