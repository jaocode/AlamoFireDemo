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

typealias ServerResponseCallback = (_ response: ServerResponse) -> Void

protocol HeroesServer
{
    var data : HeroData {get}
    func RetrieveData (_ callback: @escaping ServerResponseCallback)
    func AddHero (_ hero: Hero, callback: @escaping ServerResponseCallback)
}
