//
//  UIScreenUtil.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/07/12.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

struct UIScreenUtil {
    static func bounds()->CGRect{
        return UIScreen.mainScreen().bounds
    }
    static func screenWidth()->CGFloat{
        return UIScreen.mainScreen().bounds.size.width
    }
    static func screenHeight()->CGFloat{
        return UIScreen.mainScreen().bounds.size.height
    }
}