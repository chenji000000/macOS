//
//  AppDelegate.swift
//  EggTimer
//
//  Created by 陈吉 on 2018/8/27.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var startTimerMenuItem: NSMenuItem!
    
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    
    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

