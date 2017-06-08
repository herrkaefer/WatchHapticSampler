//
//  InterfaceController.swift
//  WatchHapticSampler WatchKit Extension
//
//  Created by HerrKaefer on 2017/6/8.
//  Copyright © 2017年 HerrKaefer. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var picker: WKInterfacePicker!
    
    // List of WKHapticType in rawValue order
    let items: [String] = [
        "notification",
        "directionUp",
        "directionDown",
        "success",
        "failure",
        "retry",
        "start",
        "stop",
        "click"
    ]
    
    var hapticType = WKHapticType.notification
    
    
    // Use the index from the picker as the rawValue for the WKHapticType
    @IBAction func pickerDidChange(_ value: Int) {
        print("picker changed")
        hapticType = WKHapticType(rawValue: value)!
        WKInterfaceDevice.current().play(.click)
    }
    
    
    @IBAction func playHaptic() {
        WKInterfaceDevice.current().play(hapticType)
    }
    
    
    func setPickerItems() {
        let pickerItems: [WKPickerItem] = items.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = "Haptic Type"
            return pickerItem
        }
        
//        var pickerItems = [WKPickerItem]()
//        for item in titles {
//            let pickerItem = WKPickerItem()
//            pickerItem.title = item
//            pickerItem.caption = "Haptic Type"
//            pickerItems.append(pickerItem)
//        }
        picker.setItems(pickerItems)
    }
    
    
    override func awake(withContext context: Any?) {
        setPickerItems()
    }
    
//    override func willActivate() {
//        super.willActivate()
//        refreshPickerItems()
//    }
    
}
