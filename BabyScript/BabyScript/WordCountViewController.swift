//
//  WordCountViewController.swift
//  BabyScript
//
//  Created by 陈吉 on 2018/8/25.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class WordCountViewController: NSViewController {
    
    @objc dynamic var wordCount = 0
    @objc dynamic var paragraphCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func dismissWordCountWindow(_ sender: NSButton) {
        let application = NSApplication.shared
        application.stopModal()
    }
    
}
