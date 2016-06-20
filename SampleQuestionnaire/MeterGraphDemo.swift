//
//   MeterGraphDemo.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/05/13.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class MeterPieGraphView: UIView {
    var _params:[Dictionary<String,AnyObject>]!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,params:[Dictionary<String,AnyObject>]) {
        super.init(frame: frame)
        _params = params;
        self.backgroundColor = UIColor.clearColor();
    }
    
    func update(link:AnyObject){
        
    }

    func startAnimating(){
        let displayLink = CADisplayLink(target: self, selector: Selector("update:"))
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }

    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!;
        
        let sideMargin:CGFloat  = 10.0;
        let width:CGFloat = rect.size.width - (sideMargin * 2);
        var start_point:CGFloat = sideMargin;
        var end_point:CGFloat = start_point + width;
    
        
        
        
        print("this is x:", start_point);
        print("this is y:", end_point);
        
        
        var max:CGFloat = 0;
        for dic : Dictionary<String,AnyObject> in _params {
            let value = CGFloat(dic["value"] as! Float)
            max += value;
        }
        
        for dic : Dictionary<String,AnyObject> in _params {
            let value = CGFloat(dic["value"] as! Float)
            end_point = start_point + width * (value/max);
            
        //2.描画用の設定（図形の線の色を設定）
        let color:UIColor = dic["color"] as! UIColor
        let cgColor:CGColorRef = color.CGColor
        CGContextSetStrokeColorWithColor(context, cgColor)
        CGContextSetLineWidth(context, 150.0)
        CGContextMoveToPoint(context, start_point, 0)
        CGContextAddLineToPoint(context, end_point, 0)
        CGContextClosePath(context)
        CGContextStrokePath(context)
        start_point = end_point
        }
    }

}
