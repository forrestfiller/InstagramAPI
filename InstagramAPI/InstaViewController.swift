//
//  InstaViewController.swift
//  InstagramAPI
//
//  Created by Forrest Filler on 7/9/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

class InstaViewController: UIViewController {
    
    var user: User!
    var userLabel: UILabel!
    
    override func loadView() {
        print("loadView: ")
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .redColor()
        let font = UIFont(name: "Arial", size: 16)
        let str = NSString(string: self.user.text)
        let bounds = str.boundingRectWithSize(CGSizeMake(frame.size.width-40, 1200), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font!], context: nil)
        self.userLabel = UILabel(frame: CGRect(x: 20, y: 84, width: frame.size.width-40, height: bounds.size.height))
        userLabel.backgroundColor = .blueColor()
        userLabel.numberOfLines = 0
        userLabel.lineBreakMode = .ByWordWrapping
        userLabel.font = font
        userLabel.text = self.user.text
        view.addSubview(self.userLabel)
        
        self.view = view

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
