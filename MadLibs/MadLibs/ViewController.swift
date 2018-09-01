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
    
    @IBOutlet weak var datePicker: NSDatePicker!
    
    @IBOutlet weak var rwDevConRadioButton: NSButton!
    
    @IBOutlet weak var threeSixtyRadioButton: NSButton!
    
    @IBOutlet weak var wwdcRadioButton: NSButton!
    
    @IBOutlet weak var yellCheck: NSButton!
    
    @IBOutlet weak var voiceSegmentedControl: NSSegmentedControl!
    
    @IBOutlet weak var resultTextField: NSTextField!
    
    @IBOutlet weak var imageView: NSImageView!
    
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
    
    fileprivate var selectedPlace: String {
        var place = "home"
        if rwDevConRadioButton.state == NSControl.StateValue.on {
            place = "RWDevCon"
        }
        else if threeSixtyRadioButton.state == NSControl.StateValue.on {
            place = "360iDev"
        }
        else if wwdcRadioButton.state == NSControl.StateValue.on {
            place = "WWDC"
        }
        return place
    }
    
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
        // Set the date picker to display the current date
        datePicker.dateValue = Date()
        // Set the radio group's initial selection
        rwDevConRadioButton.state = NSControl.StateValue.on
        
        yellCheck.state = NSControl.StateValue.off
        // Set the segmented control initial selection
        voiceSegmentedControl.selectedSegment = 1
        
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
        // 1
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        
        // 2
        let singularNoun = singularNounCombo.stringValue
        
        // 3
        let amount = amountSilder.integerValue
        
        // 4
        let pluralNoun = pluralNouns[pluralNounPopup.indexOfSelectedItem]
        
        // 5
        let phrase = phraseTextView.string 
        
        // 6
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let date = dateFormatter.string(from: datePicker.dateValue)
        
        // 7
        var voice = "said"
        if yellCheck.state == NSControl.StateValue.on {
            voice = "yelled"
        }
        
        // 8
        let sentence = "On \(date), at \(selectedPlace) a \(singularNoun) \(pastTenseVerb) \(amount) \(pluralNoun) and \(voice), \(phrase)"
        
        // 9
        resultTextField.stringValue = sentence
        imageView.image = NSImage(named: NSImage.Name(rawValue: "face"))
        
        // 10
        let selectedSegment = voiceSegmentedControl.selectedSegment
        let voiceRate = VoiceRate(rawValue: selectedSegment) ?? .normal
        readSentence(sentence, rate: voiceRate)
    }
    
    @IBAction func radioButtonChanged(_ sender: AnyObject) {
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    


}

