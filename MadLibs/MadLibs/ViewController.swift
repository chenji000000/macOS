//
//  ViewController.swift
//  MadLibs
//
//  Created by 陈吉 on 2018/8/31.
//  Copyright © 2018年 陈吉. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pastTenseVerbTextField: NSTextField!
    
    @IBOutlet weak var singularNounCombo: NSComboBox!
    
    @IBOutlet weak var pluralNounPopup: NSPopUpButton!
    
    @IBOutlet var phraseTextView: NSTextView!
    
    @IBOutlet weak var amountLabel: NSTextField!
    
    @IBOutlet weak var amountSilder: NSSlider!
    
    fileprivate let singularNouns = ["dog", "muppet", "ninja", "pirate", "dev" ]
    fileprivate let pluralNouns = ["tacos", "rainbows", "iPhones", "gold coins"]
    
    // 1
    fileprivate enum VoiceRate: Int  {
        case slow
        case normal
        case fast
        
        var speed: Float {
            switch self {
            case .slow:
                return 60
            case .normal:
                return 175;
            case .fast:
                return 360;
            }
        }
    }
    //2
    fileprivate let synth = NSSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Sets the default text for the pastTenseVerbTextField property
        pastTenseVerbTextField.stringValue = "ate"
        // Setup the combo box with singular nouns
        singularNounCombo.removeAllItems()
        singularNounCombo.addItems(withObjectValues: singularNouns)
        singularNounCombo.selectItem(at: singularNouns.count-1)
        
        // Setup the pop up button with plural nouns
        pluralNounPopup.removeAllItems()
        pluralNounPopup.addItems(withTitles: pluralNouns)
        pluralNounPopup.selectItem(at: 0)
        
        phraseTextView.string = "Me coding Mac Apps!!!"
        // Update the amount slider
        sliderChanged(self)
        
    }
    
    fileprivate func readSentence(_ sentence: String, rate: VoiceRate ) {
        synth.rate = rate.speed
        synth.stopSpeaking()
        synth.startSpeaking(sentence)
    }
    @IBAction func sliderChanged(_ sender: Any) {
        let amount = amountSilder.integerValue
        amountLabel.stringValue = "Amount: [\(amount)]"
    }
    
    @IBAction func goButtonClicked(_ sender: Any) {
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        let singularNoun = singularNounCombo.stringValue
        let pluralNoun = pluralNouns[pluralNounPopup.indexOfSelectedItem]
        let phrase = phraseTextView.string 
        
        let madLibSentence = "A \(singularNoun) \(pastTenseVerb) \(pluralNoun) and said, \(phrase)!"
        
        print("\(madLibSentence)")
        readSentence(madLibSentence, rate: .normal)
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    


}

