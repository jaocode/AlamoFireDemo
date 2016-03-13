//
//  ActiveClient.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation

class Server
{
    static let active : ServerConnection = SuperHeroes (server: "http://127.0.0.1:8080/api/heroes")
}