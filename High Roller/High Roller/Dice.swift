//
//  Dice.swift
//  High Roller
//
//  Created by 陈吉 on 2018/9/6.
//  Copyright © 2018年 Sarah Reichelt. All rights reserved.
//

import Foundation

struct Dice {
    var value: Int?
  
    mutating func rollDie(numberOfSides: Int = 6) {
        value = Int(arc4random_uniform(UInt32(numberOfSides))) + 1
    }
}
