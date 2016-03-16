//
//  Hero.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation
import AlamofireJsonToObjects
import EVReflection

// Model representing a super hero's power
// EVObject required to utilize AlamofireJsonToObject mapping
class HeroPower : EVObject
{
    var _id : String?
    var power : String?
    
    required init ()
    {
        super.init()
    }
    
    init (power: String)
    {
        self.power = power
        super.init()
    }
    
}

// Model representing a super hero
// EVObject required to utilize AlamofireJsonToObject mapping
class Hero : EVObject
{
    var _id : String?
    var heroName : String?
    var firstName : String?
    var lastName : String?
    var powers : [HeroPower] = [HeroPower]()
}