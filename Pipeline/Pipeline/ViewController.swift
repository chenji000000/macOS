//
//  ViewController.swift
//  Pipeline
//
//  Created by 陈吉 on 2018/10/9.
//  Copyright © 2018年 陈吉. All rights reserved.
//
import MetalKit
import Cocoa

class ViewController: NSViewController {

    var renderer: Renderer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let metalView = view as? MTKView else {
            fatalError("metal view not set up in storyboard")
        }
        renderer = Renderer(metalView: metalView)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

