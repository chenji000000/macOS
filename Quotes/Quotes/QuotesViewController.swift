//
//  QuotesViewController.swift
//  Quotes
//
//  Created by 陈吉 on 2018/8/29.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    
    @IBOutlet var textLabel: NSTextField!
    
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
}
// MARK: Actions
extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "QuotesViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
