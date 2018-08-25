//
//  ViewController.swift
//  BabyScript
//
//  Created by 陈吉 on 2018/8/24.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var text: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        text.toggleRuler(nil)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func showWordCountWindow(_ sender: AnyObject) {
        
        // 1
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Word Count Window Controller")) as! NSWindowController
        
        if let wordCountWindow = wordCountWindowController.window, let textStorage = text.textStorage {
            
            // 2
            let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
            wordCountViewController.wordCount = textStorage.words.count
            wordCountViewController.paragraphCount = textStorage.paragraphs.count
            
            // 3
            let application = NSApplication.shared
            application.runModal(for: wordCountWindow)
            // 4
            wordCountWindow.close()
        }
    }


}

