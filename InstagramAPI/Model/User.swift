//
//  User.swift
//  InstagramAPI
//
//  Created by Forrest Filler on 7/6/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var caption: Dictionary<String, AnyObject>!
    var text: String!
    
    
    func populate(venueInfo: Dictionary<String, AnyObject>){
    
        if let _caption = venueInfo["caption"] as? Dictionary<String, AnyObject>{
            self.caption = _caption
            //print("\(_caption)")
            if let _text = _caption["text"] as? String{
                self.text = _text
                print("\(_text)")
            }
        }
    }
}
