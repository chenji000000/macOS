//
//  StringExtension.swift
//  Panagram
//
//  Created by 陈吉 on 2018/8/28.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Foundation

extension String {
    func isAnagramOf(_ s: String) -> Bool {
        //1
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        //2
        return lowerSelf.sorted() == lowerOther.sorted()
    }
    func isPalindrome() -> Bool {
        //1
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        //2
        let s = String(f.reversed())
        //3
        return  f == s
    }
}
