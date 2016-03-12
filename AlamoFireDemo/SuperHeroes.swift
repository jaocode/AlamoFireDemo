//
//  SuperHeroes.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation
import Alamofire
import JSONJoy

//extension SuperHeroes : HeroData
//{
//    var count : Int
//    {
//        get {return heroes.count}
//    }
//
//    subscript (heroName : String) -> Hero?
//    {
//        get
//        {
//            var result : Hero?
//            result = heroes[heroName]
//            return result
//        }
//    }
//}


class DataWrapper : HeroData
{
    private var client : SuperHeroes
    
    private init (dataSource : SuperHeroes)
    {
        client = dataSource
    }
    
    var count : Int
    {
        get {return client.heroes.count}
    }
    
    
    subscript (index : Int) -> Hero
    {
        get
        {
            return client.heroes [index]
        }
    }
    
//    subscript (heroName : String) -> Hero?
//    {
//        get
//        {
//            var result : Hero?
//            result = client?.heroes[heroName]
//            return result
//        }
//    }
}

//extension Hero : JSONJoy
//{
//    init(_ decoder: JSONDecoder) throws
//    {
//    
//    }
//}

@objc class SuperHeroes : NSObject, Client
{
    private var heroes = [Hero]() //[String:Hero]()
    private var serverURL = "http://127.0.0.1:8080/api/heroes"
    
    var data : HeroData
    {
        return DataWrapper (dataSource: self)
    }
    
    func RetrieveData(callback: ServerResponseCallback)
    {
        Alamofire.request(.GET, serverURL).responseJSON
        {
            response in
            
            switch response.result
            {
            case .Success(let json):
                //print(json)
                self.heroes.removeAll()
                
                if let JSONData = json as? [AnyObject]
                {
                    for heroData in JSONData
                    {
                        if let hero = try? Hero(JSONDecoder(heroData))
                        {
                            self.heroes.append(hero)
                        }
                    }
                }
                
                callback (response: .Success (data: DataWrapper (dataSource: self)))
                    break;
            case .Failure(let error):
                callback (response: .Error(message: error.description))
                    break;
            }
        }
    }
}