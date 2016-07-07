//
//  ViewController.swift
//  ios tableview navbar control
//
//  Created by Harrison McGuire on 7/5/16.
//  Copyright © 2016 severallevels. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let redditURL: NSURL = NSURL(string: "https://www.reddit.com/r/gaming/.json")!
    let data = NSData(contentsOfURL: NSURL(string: "https://www.reddit.com/r/gaming/.json")!)!
    
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // your number of cell here
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // your cell coding
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
    
    func loadData() {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
    
                if let posts = json["data"]["children"]["data"] as? [[String: AnyObject]] {
                    for post in posts {
                        if let name = post["name"] as? String {
                            names.append(name)
                        }
                    }
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
                print(names) // ["Bloxus test", "Manila Test"]
    }

}

