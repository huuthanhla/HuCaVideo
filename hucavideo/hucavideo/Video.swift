//
//  Video.swift
//  hucavideo
//
//  Created by HungNV on 2/21/18.
//  Copyright © 2018 HungNV. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let uppercasedFirstCharacter = String(key.characters.first!).uppercased()
        
//        let range = key.startIndex...key.characters.index(key.startIndex, offsetBy: 0)
//        let selectorString = key.replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        
        let range = NSMakeRange(0, 1)
        let selectorString = NSString(string: key).replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let reponds = self.responds(to: selector)
        
        if !reponds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
}

class Video: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: Date?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}
