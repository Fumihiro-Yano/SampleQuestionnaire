//
//  UIColor.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/06/18.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

extension UIColor {
    class func hex (hexStr : NSString, alpha : CGFloat) -> UIColor {
        let hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}
