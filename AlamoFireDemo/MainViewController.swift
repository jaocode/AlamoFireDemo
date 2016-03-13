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
    var heroes = Server.active.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        Server.active.RetrieveData {
            response in
            
            switch response
            {
            case .Success (let data):
                self.tableView.reloadData()
                break
            case .Error(let msg):
                break
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let hero = heroes[section]
        return hero.heroName
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return heroes.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let hero = heroes[section]
        return 1 + hero.powers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell (style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        let hero = heroes[indexPath.section]
        
        switch indexPath.row
        {
        case 0:
            cell.detailTextLabel?.text = "Real Name"
            cell.textLabel?.text = "\(hero.firstName) \(hero.lastName)"
        default:
            cell.textLabel?.text = hero.powers[indexPath.row - 1].power
            cell.detailTextLabel?.text = "Power"
            break
        }
        
        return cell
    }
}

