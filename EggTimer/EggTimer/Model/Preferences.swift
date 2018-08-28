//
//  Preferences.swift
//  EggTimer
//
//  Created by 陈吉 on 2018/8/28.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Foundation

struct Preferences {
    
    // 1
    var selectedTime: TimeInterval {
        get {
            // 2
            let savedTime = UserDefaults.standard.double(forKey: "selectedTime")
            if savedTime > 0 {
                return savedTime
            }
            // 3
            return 360
        }
        set {
            // 4
            UserDefaults.standard.set(newValue, forKey: "selectedTime")
        }
    }
    
}
