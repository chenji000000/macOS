/*
* ViewController.swift
* SlidesMagic
*
* Created by Gabriel Miro on 7/11/15.
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Cocoa

class ViewController: NSViewController {
  
    @IBOutlet weak var collectionView: NSCollectionView!
    
    let imageDirectoryLoader = ImageDirectoryLoader()

  override func viewDidLoad() {
    super.viewDidLoad()
    let initialFolderUrl = NSURL.fileURL(withPath: "/Library/Desktop Pictures", isDirectory: true)
    imageDirectoryLoader.loadDataForFolderWithUrl(folderURL: initialFolderUrl as NSURL)
    configureCollectionView()
  }
  
  func loadDataForNewFolderWithUrl(folderURL: NSURL) {
    imageDirectoryLoader.loadDataForFolderWithUrl(folderURL: folderURL)
    collectionView.reloadData()
  }
  
  private func configureCollectionView() {
    // 1
    let flowLayout = NSCollectionViewFlowLayout()
    flowLayout.itemSize = NSSize(width: 160.0, height: 140.0)
    flowLayout.sectionInset = NSEdgeInsets(top: 30.0, left: 20.0, bottom: 30.0, right: 20.0)
    flowLayout.minimumInteritemSpacing = 20.0
    flowLayout.minimumLineSpacing = 20.0
    collectionView.collectionViewLayout = flowLayout
    // 2
    view.wantsLayer = true
    // 3
    collectionView.backgroundColors = [NSColor.black]
//    collectionView.layer?.backgroundColor = NSColor.black.cgColor
  }

  // 1
  @IBAction func showHideSections(sender: AnyObject) {
    // 2
    let show = (sender as! NSButton).state
    imageDirectoryLoader.singleSectionMode = (show == NSControl.StateValue.off)
    imageDirectoryLoader.setupDataForUrls(urls: nil)
    // 3
    collectionView.reloadData()
  }

}

extension ViewController : NSCollectionViewDataSource {
  
  // 1
  func numberOfSections(in collectionView: NSCollectionView) -> Int {
    return imageDirectoryLoader.numberOfSections
  }
  
  // 2
  func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageDirectoryLoader.numberOfItemsInSection(section: section)
  }
  
  // 3
  func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
    
    // 4
    let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)
    guard let collectionViewItem = item as? CollectionViewItem else {return item}
    
    // 5
    let imageFile = imageDirectoryLoader.imageFileForIndexPath(indexPath: indexPath as NSIndexPath)
    collectionViewItem.imageFile = imageFile
    if let selectedIndexPath = collectionView.selectionIndexPaths.first, selectedIndexPath == indexPath {
      collectionViewItem.setHighlight(selected: true)
    } else {
      collectionViewItem.setHighlight(selected: false)
    }
    return item
  }
  
  func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
    // 1
    let view = collectionView.makeSupplementaryView(ofKind: NSCollectionView.SupplementaryElementKind.sectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderView"), for: indexPath as IndexPath) as! HeaderView
    // 2
    view.sectionTitle.stringValue = "Section \(indexPath.section)"
    let numberOfItemsInSection = imageDirectoryLoader.numberOfItemsInSection(section: indexPath.section)
    view.imageCount.stringValue = "\(numberOfItemsInSection) image files"
    return view
  }
  
}

extension ViewController : NSCollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
    return imageDirectoryLoader.singleSectionMode ? NSZeroSize : NSSize(width: 1000, height: 40)
  }
}

extension ViewController : NSCollectionViewDelegate {
  // 1
  func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
    // 2
    guard let indexPath = indexPaths.first else {
      return
    }
    // 3
    guard let item = collectionView.item(at: indexPath as IndexPath) else {
      return
    }
    (item as! CollectionViewItem).setHighlight(selected: true)
  }
  
  // 4
  func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
    guard let indexPath = indexPaths.first else {
      return
    }
    guard let item = collectionView.item(at: indexPath as IndexPath) else {
      return
    }
    (item as! CollectionViewItem).setHighlight(selected: false)
  }
}
