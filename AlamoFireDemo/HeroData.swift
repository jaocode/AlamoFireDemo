//
//  Server.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation


protocol HeroData
{
    var count : Int { get }
    //subscript (heroName : String) -> Hero? { get }
    subscript (index : Int) -> Hero? { get }
}