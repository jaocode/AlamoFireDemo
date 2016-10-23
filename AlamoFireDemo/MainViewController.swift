//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by Justin Okun on 3/11/16.
//  Copyright © 2016 Justin Okun. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController
{
    var heroes = ActiveServer.active.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        refreshData()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let hero = heroes[section]
        return hero.heroName
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let hero = heroes[section]
        return 1 + hero.powers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell (style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        let hero = heroes[(indexPath as NSIndexPath).section]

        switch (indexPath as NSIndexPath).row
        {
        case 0:
            cell.detailTextLabel?.text = "Real Name"
            cell.textLabel?.text = "\(hero.firstName ?? "") \(hero.lastName ?? "")"
        default:
            cell.textLabel?.text = hero.powers[(indexPath as NSIndexPath).row - 1].power
            cell.detailTextLabel?.text = "Power"
            break
        }
        
        return cell
    }
    
    func refreshData ()
    {
        ActiveServer.active.RetrieveData {
            response in
            
            switch response
            {
            case .success:
                self.tableView.reloadData()
                break
            case .error(let msg):
                print (msg)
                break
            }
        }

    }
    
    @IBAction func addHeroButtonSelected ()
    {
        let newHero = SuperHeroGenerator().generate()
        
        ActiveServer.active.AddHero(newHero)
        {
            response in
            
            switch response
            {
            case .success:
                self.tableView.reloadData()
                break
            case .error(let msg):
                print (msg)
                break
            }
        }
    }
    
    @IBAction func refreshButtonSelected ()
    {
        refreshData ()
    }
}

