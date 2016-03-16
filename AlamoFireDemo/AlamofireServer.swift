//
//  AlamofireServer.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation
import Alamofire

// Used to abstract the data from server
private class DataWrapper : HeroData
{
    private var serverConnection : AlamofireServer
    
    private init (dataSource : AlamofireServer)
    {
        serverConnection = dataSource
    }
    
    var count : Int
    {
        get {return serverConnection.heroes.count}
    }
    
    subscript (index : Int) -> Hero
    {
        get
        {
            return serverConnection.heroes [index]
        }
    }
}

// Implementation of HeroesServer that utilizes Alamofire to talk to a RESTful server
class AlamofireServer : HeroesServer
{
    private var heroes = [Hero]()
    private var server : String
    
    var data : HeroData
    {
        return DataWrapper(dataSource: self)
    }
    
    init (server: String)
    {
        self.server = server
    }
    
    // Requests and downloads the server's database of super heroes
    func RetrieveData(callback: ServerResponseCallback)
    {
        Alamofire.request(.GET, server).responseArray
        {
            (response: Result<[Hero], NSError>) in 
                
            switch response
            {
            case .Success(let data):
                self.heroes = data
                callback (response: .Success)
            case .Failure(let error):
                callback (response: .Error(message: error.description))
                break
            }
        }
    }
    
    // Submits a new super hero for inclusion in the server's database
    func AddHero (hero: Hero, callback: ServerResponseCallback)
    {
        // Just in case our cast fails. Parameters must be of type [String : AnyObject]
        guard let jsonData = hero.toDictionary() as? [String : AnyObject] else
        {
            callback(response: .Error(message: "Problem with object conversion to JSON"))
            return 
        }
        
        Alamofire.request(.POST, server, parameters: jsonData, encoding: .JSON).responseJSON{
            (response) in
            
            switch response.result
            {
            case .Success:
                self.RetrieveData(callback)
            case .Failure(let error):
                callback(response: .Error(message: error.description))
                break
            }
        }

    }
}