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
    fileprivate var serverConnection : AlamofireServer
    
    fileprivate init (dataSource : AlamofireServer)
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
    fileprivate var heroes = [Hero]()
    fileprivate var server : String
    
    var data : HeroData
    {
        return DataWrapper(dataSource: self)
    }
    
    init (server: String)
    {
        self.server = server
    }
    
    // Requests and downloads the server's database of super heroes
    func RetrieveData(_ callback: @escaping ServerResponseCallback)
    {
        Alamofire.request(server).responseArray
        {
            (response: DataResponse<[Hero]>) in
            
            switch response.result
            {
            case .success(let data):
                self.heroes = data
                callback (.success)
            case .failure(let error):
                callback (.error(message: error.localizedDescription))
                break
            }
        }
    }
    
    // Submits a new super hero for inclusion in the server's database
    func AddHero (_ hero: Hero, callback: @escaping ServerResponseCallback)
    {
        // Just in case our cast fails. Parameters must be of type [String : AnyObject]
        guard let jsonData = hero.toDictionary() as? [String : AnyObject] else
        {
            callback(.error(message: "Problem with object conversion to JSON"))
            return 
        }
        
        Alamofire.request(server, method: .post, parameters: jsonData, encoding: JSONEncoding.default).responseJSON{
            (response) in
            
            switch response.result
            {
            case .success:
                self.RetrieveData(callback)
            case .failure(let error):
                callback(.error(message: error.localizedDescription))
                break
            }
        }

    }
}
