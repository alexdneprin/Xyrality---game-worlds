//
//  GameWorld.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation

struct GameWorld {
    
    var ID: NSInteger? = 0
    var name: String? = ""
    var country: String? = ""
    var language: String? = ""
    var online: Bool? = false

    init(withDictionary dictJSON: [String:Any]?){
        
        self.ID = dictJSON?[JSONKeys.id] as? NSInteger
        self.name = dictJSON?[JSONKeys.name] as? String
        self.country = dictJSON?[JSONKeys.country] as? String
        self.language = dictJSON?[JSONKeys.language] as? String
        
        let worldStatusDict: NSDictionary = (dictJSON?[JSONKeys.worldStatus] as? NSDictionary)!
        
        if worldStatusDict[JSONKeys.description] as? String == JSONKeys.online{
            self.online = true
        }
    }
}
