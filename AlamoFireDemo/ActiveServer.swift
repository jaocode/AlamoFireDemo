//
//  ActiveServer.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation

class ActiveServer
{
    static let active : HeroesServer = AlamofireServer (server: "http://127.0.0.1:3000/api/heroes")
}
