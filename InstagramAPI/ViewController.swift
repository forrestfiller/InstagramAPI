//
//  ViewController.swift
//  InstagramAPI
//
//  Created by Forrest Filler on 7/6/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var instaTable: UITableView!
    var instaList = Array<User>()
    var searchField: UITextField!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .whiteColor()
        
        self.searchField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 44))
        self.searchField.delegate = self
        searchField.backgroundColor = .lightGrayColor()
        
//        self.instaTable = UITableView(frame: frame, style: .Plain)
        self.instaTable = UITableView(frame: CGRect(x: 0, y: 64, width: frame.size.width, height: frame.size.height), style: .Plain)
        self.instaTable.delegate = self
        self.instaTable.dataSource = self
        self.instaTable.tableHeaderView = searchField
        view.addSubview(self.instaTable)
        
        self.view = view
        
    }
    
    func instaRequest(user: String){
        //print("instaRequest: ")
        
        //let url = "https://www.instagram.com/juicecrawl/media/"
        let url = "https://www.instagram.com/\(user)/media/"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
        
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                //print("instaRequest: \(json)")
                
                if let items = json["items"] as? Array<Dictionary<String, AnyObject>>{
                    print("instaRequest: \(items)")
                    
                    for instaInfo in items {
                        let instaData = User()
                        instaData.populate(instaInfo)
                        self.instaList.append(instaData)
                    }
                    self.instaTable.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.instaList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let user = self.instaList[indexPath.row]
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = user.text
            return cell
        }
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = user.text
        return cell
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let searchText = self.searchField.text!
        //print("textFieldShouldReturn: ")
        self.instaRequest(searchText)
        self.instaList.removeAll()
        
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let user = self.instaList[indexPath.row]
        let instaVc = InstaViewController()
        instaVc.user = user
        self.navigationController?.pushViewController(instaVc, animated: true)
    }

}

