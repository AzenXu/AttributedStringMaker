//
//  ViewController.swift
//  AttributeStringMaker
//
//  Created by XuAzen on 2017/5/17.
//  Copyright © 2017年 com.azen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.attributedText = "测试测试".attriString.setAtt({ (make) in
            make.font = UIFont.systemFont(ofSize: 30);
            make.color = UIColor.green;
            make.backgroundColor = UIColor.yellow;
        }).append(string: "前中后".attriString.setAtt({ (make) in
            make.font = UIFont.systemFont(ofSize: 10);
            make.color = UIColor.black;
            make.obliqueness = 0.5;
            make.underLine = NSUnderlineStyle.styleDouble;
        }))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

