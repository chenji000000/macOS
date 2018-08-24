//
//  WindowController.swift
//  BabyScript
//
//  Created by 陈吉 on 2018/8/24.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        //1.
        if let window = window, let screen = window.screen {
            let offsetFromLeftOfScreen: CGFloat = 100
            let offsetFromTopOfScreen: CGFloat = 100
            //2.
            let screenRect = screen.visibleFrame
            //3.
            let mewOriginY = screenRect.maxY - window.frame.height - offsetFromTopOfScreen
            //4.
            window.setFrameOrigin(NSPoint(x: offsetFromLeftOfScreen, y: mewOriginY))
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }

}
