//
//  Hero.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation
import Gloss

// Model representing a super hero's power
// Glossy required to utilize json to Object mapping
struct HeroPower : Glossy
{
    var id : String?
    var power : String = ""
    
    init? (json: JSON)
    {
        guard
            // <~~ is a custom operator, implemented by Gloss, that maps JSON elements to Swift types
            let id: String = "_id" <~~ json,
            let power: String = "power" <~~ json
        else { return nil }
        
        self.id = id
        self.power = power
    }
    
    init (power: String)
    {
        self.power = power
    }
    
    // Required to conform to the Glossy protocol.
    // This encodes the struct into JSON
    func toJSON() -> JSON?
    {
        return jsonify([
            // ~~> is a custom operator, implemented by Gloss, that maps Swift types to JSON elements
            "_id" ~~> id,
            "power" ~~> power
        ])
    }
}

// Model representing a super hero
// Glossy required to utilize json to Object mapping
struct Hero : Glossy
{
    var id : String?
    var heroName : String?
    var firstName : String?
    var lastName : String?
    var powers : [HeroPower] = [HeroPower]()
    
    init()
    {
    }
    
    init? (json: JSON)
    {
        guard
            // <~~ is a custom operator, implemented by Gloss, that maps JSON elements to Swift types
            let id : String = "_id" <~~ json,
            let heroName : String = "heroName" <~~ json,
            let firstName : String = "firstName" <~~ json,
            let lastName : String = "lastName" <~~ json,
            let powers : [HeroPower] = "powers" <~~ json
        else {return nil}
        
        self.id = id
        self.heroName = heroName
        self.firstName = firstName
        self.lastName = lastName
        self.powers = powers
    }
    
    // Required to conform to the Glossy protocol.
    // This encodes the struct into JSON
    func toJSON() -> JSON?
    {
        return jsonify([
            // ~~> is a custom operator, implemented by Gloss, that maps Swift types to JSON elements
            "_id" ~~> id,
            "heroName" ~~> heroName,
            "firstName" ~~> firstName,
            "lastName" ~~> lastName,
            "powers" ~~> powers
        ])
    }
}
