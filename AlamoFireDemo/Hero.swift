//
//  Hero.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation
import JSONJoy

struct HeroPower : JSONJoy
{
    let power : String
        
    init(_ decoder: JSONDecoder) throws
    {
        power = try decoder["power"].getString()
    }
}

struct Hero : JSONJoy
{
    let heroName : String
    let firstName : String
    let lastName : String
    var powers : [HeroPower]
    
    init(_ decoder: JSONDecoder) throws
    {
        heroName = try decoder["heroName"].getString()
        firstName = try decoder["firstName"].getString()
        lastName = try decoder["lastName"].getString()
        
        powers = [HeroPower]()
        
        guard let pwrdecoders = decoder["powers"].array else
        {
            throw JSONError.WrongType
        }
        
        for pwrdecoder in pwrdecoders
        {
            if let power : HeroPower = try? HeroPower(pwrdecoder)
            {
                powers.append(power)
            }
        }
    }
}
