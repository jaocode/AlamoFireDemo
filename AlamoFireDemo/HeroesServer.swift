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
    case success
    case error (message: String)
}

typealias ServerResponseCallback = (ServerResponse) -> Void

protocol HeroesServer
{
    var data : HeroData {get}
    func RetrieveData (callback: @escaping ServerResponseCallback)
    func AddHero (hero: Hero, callback: @escaping ServerResponseCallback)
}
