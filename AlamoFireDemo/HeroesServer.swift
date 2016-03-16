//
//  HeroesServer.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation

enum ServerResponse
{
    case Success
    case Error (message: String)
}

typealias ServerResponseCallback = (response: ServerResponse) -> Void

protocol HeroesServer
{
    var data : HeroData {get}
    func RetrieveData (callback: ServerResponseCallback)
    func AddHero (hero: Hero, callback: ServerResponseCallback)
}