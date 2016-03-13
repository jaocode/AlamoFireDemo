//
//  Client.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation

enum ServerResponse
{
    case Success (data : HeroData)
    case Error (message: String)
}

typealias ServerResponseCallback = (response: ServerResponse) -> Void

protocol ServerConnection
{
    var data : HeroData {get}
    func RetrieveData (callback: ServerResponseCallback)
}