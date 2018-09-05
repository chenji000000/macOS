//
//  HeaderView.swift
//  SlidesMagic
//
//  Created by 陈吉 on 2018/9/5.
//  Copyright © 2018年 razeware. All rights reserved.
//

import Cocoa

class HeaderView: NSView {
  
  // 1
  @IBOutlet weak var sectionTitle: NSTextField!
  @IBOutlet weak var imageCount: NSTextField!
  
  // 2
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        NSColor(calibratedWhite: 0.8 , alpha: 0.8).set()
        dirtyRect.fill(using: NSCompositingOperation.sourceOver)
    }
    
}
