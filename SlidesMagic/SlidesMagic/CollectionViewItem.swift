//
//  CollectionViewItem.swift
//  SlidesMagic
//
//  Created by 陈吉 on 2018/9/5.
//  Copyright © 2018年 razeware. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
  
  func setHighlight(selected: Bool) {
    view.layer?.borderWidth = selected ? 5.0 : 0.0
  }
  
  // 1
  var imageFile: ImageFile? {
    didSet {
      guard isViewLoaded else { return }
      if let imageFile = imageFile {
        imageView?.image = imageFile.thumbnail
        textField?.stringValue = imageFile.fileName
      } else {
        imageView?.image = nil
        textField?.stringValue = ""
      }
    }
  }
  
  // 2
  override func viewDidLoad() {
    super.viewDidLoad()
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.lightGray.cgColor
    // 1
    view.layer?.borderWidth = 0.0
    // 2
    view.layer?.borderColor = NSColor.white.cgColor
  }
}
