//
//  ViewController.swift
//  HelloWorld
//
//  Created by 陈吉 on 2018/8/27.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    
    @IBOutlet weak var helloLabel: NSTextField!
    
    @IBAction func sayButtonClicked(_ sender: Any) {
        var name = nameField.stringValue
        if name.isEmpty {
            name = "World"
        }
        let greeting = "Hello \(name)!"
        helloLabel.stringValue = greeting
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

