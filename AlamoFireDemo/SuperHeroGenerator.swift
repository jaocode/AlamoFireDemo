//
//  SuperHeroGenerator.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/14/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import Foundation

class SuperHeroGenerator
{
    let heroNames = ["Sparkle", "Star", "Dynamo", "Captain", "Puffy", "Nuclear", "Furious", "Phantom", "Incredible", "Stealth", "Fantastic", "Air", "Earth", "Fire", "Water", "Justice", "Hammer", "Smash", "Man", "Woman", "Punch", "Oracle", "Thunder", "Magic", "Frozen", "Nova", "Ice", "Squishy", "Steel", "Moon", "Shadow", "Transparent", "Invisible", "Mutant", "Amazing"]
    let firstNames = ["Bruce", "Donald", "Hillary", "Elon", "Steve", "Bill", "Britney", "Kim", "Tim", "Barack", "George", "Larry", "Bob", "Bruce", "Ronald"]
    let lastNames = ["Lee", "Trump", "Clinton", "Musk", "Jobs", "Gates", "Spears", "Kardashian", "Cook", "Obama", "Bush", "Washington", "Nye", "Parker", "Ellison", "Dole", "Campbell", "Regan"]
    let powers = ["Anger", "Speed talking", "Hitting things", "Fists of Fury", "Special Effects", "Loud noises", "Unnecessary complexity", "Water colors", "Pretty things", "Universally annoying", "More average than average", "Talks to pigeons"]
    
    fileprivate func random (_ array : [String]) -> String
    {
        return array [Int(arc4random_uniform(UInt32(array.count)))]
    }
    
    func generate () -> Hero
    {
        var hero = Hero()
        
        hero.heroName = "\(random(heroNames)) \(random(heroNames))"
        hero.firstName = random (firstNames)
        hero.lastName = random (lastNames)
        
        hero.powers.append(HeroPower(power: random(powers)))
        
        return hero
    }
}
