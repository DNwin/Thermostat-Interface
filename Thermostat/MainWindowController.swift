//
//  MainWindowController.swift
//  Thermostat
//
//  Created by Dennis Nguyen on 7/24/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    private var privateTemperature = 68
    dynamic var temperature: Int {
        set {
            println("set temp to \(newValue)")
            privateTemperature = newValue
        }
        get {
            println("get temp")
            return privateTemperature
        }
    }
    dynamic var isOn = true
    
    @IBOutlet weak var powerButton: NSButton?
    
    
    

    override var windowNibName: String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        powerButton?.integerValue = isOn.hashValue

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func makeWarmer(sender: NSButton) {
        // Manaually make KVO compliant
//        let newTemperature = temperature + 1
//        setValue(newTemperature, forKey: "temperature")
        
        
        // Notify KVO recievers of change
//        willChangeValueForKey("temperature")
//        temperature++
//        didChangeValueForKey("temperature")
        
        // Add "dynamic" to property to automatically do it
        temperature++
    }
    
    @IBAction func makeCooler(sender: NSButton) {
        temperature--
    }
    
    @IBAction func powerButton(sender: NSButton) {
        isOn = !isOn
    }
}
