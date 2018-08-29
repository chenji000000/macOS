//
//  main.swift
//  Panagram
//
//  Created by 陈吉 on 2018/8/28.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Foundation

let panagram = Panagram()
if CommandLine.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}


