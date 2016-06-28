//
//  MeterGraphView.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/28.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class MeterGraphView: UIView {

    var _params:[Dictionary<String,AnyObject>]!
    var _end_point:CGFloat!
    var _width:CGFloat!
    var _change_point:CGFloat!
    var maxMovingPoint:CGFloat!
    
    var image: UIImage!
    var isFirstDrawView:Bool!
    var currentUpMeter:String!
    let sideMargin:CGFloat = 10.0
    let hundredPercent:CGFloat = 100.0
    let contextHight:CGFloat = 80
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,params:[Dictionary<String,AnyObject>]) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor();
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        let width = myBoundSize.width
        isFirstDrawView = true
        _params = params
        _width = width - (sideMargin * 2)
        _end_point = sideMargin
    }
    
    func updateLeftMeter(link:AnyObject) {
        let onePercentWidth = _width/hundredPercent
        _end_point = _end_point + onePercentWidth
        if(_end_point - sideMargin > maxMovingPoint) {
            link.invalidate()
            _change_point = maxMovingPoint
            print(_change_point)
            _end_point = maxMovingPoint
        }
        else{
            self.setNeedsDisplay()
        }
    }
    
    func updateRightMeter(link:AnyObject){
        let onePercentWidth = _width/hundredPercent
        _end_point = _end_point - onePercentWidth
        if(_end_point - sideMargin < maxMovingPoint) {
            link.invalidate()
            _change_point = maxMovingPoint
            print(_change_point)
            _end_point = maxMovingPoint
        }
        else{
            self.setNeedsDisplay()
        }
    }
    
    func getCurrentImage() -> UIImage {
        // nilだったら再度描画させる
        if image == nil {
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image!
    }
    
    
    //ViewContorllerから呼び出す
    func startAnimating(params:[Dictionary<String,AnyObject>]){
        var pm = getPlusParams(params)
        var value:CGFloat!
        _params = pm.palams
        if (pm.movingMeter == "left") {
            value = pm.palams[0]["value"]! as! CGFloat
            maxMovingPoint = sideMargin + _width * (value/10)
            currentUpMeter = pm.movingMeter
            let displayLink = CADisplayLink(target: self, selector: Selector("updateLeftMeter:"))
            displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        }
        else if (pm.movingMeter == "right") {
            value = pm.palams[0]["value"]! as! CGFloat
            maxMovingPoint = _width - (_width * (value/10))
            currentUpMeter = pm.movingMeter
            let displayLink = CADisplayLink(target: self, selector: Selector("updateRightMeter:"))
            displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        }
    }
    
    //最初のグラフを作成するメソッド
    func drawFirstGraphView(rect: CGRect) {
        var start_point:CGFloat = sideMargin;
        var end_point:CGFloat = start_point;
        var max:CGFloat = 0;
        for dic : Dictionary<String,AnyObject> in _params {
            let value = CGFloat(dic["value"] as! Float)
            max += value;
        }
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        let context:CGContextRef = UIGraphicsGetCurrentContext()!;
        var num:Int = 0
        for dic : Dictionary<String,AnyObject> in _params {
            let value = CGFloat(dic["value"] as! Float)
            end_point = start_point + _width * (value/max);
            num += 1
            if(num == 1) {
                print("\(num)回目")
                _change_point = end_point
                _end_point = _change_point
            }
            let color:UIColor = dic["color"] as! UIColor
            let cgColor:CGColorRef = color.CGColor
            CGContextSetStrokeColorWithColor(context, cgColor)
            CGContextSetLineWidth(context, contextHight)
            CGContextMoveToPoint(context, start_point, 0)
            CGContextAddLineToPoint(context, end_point, 0)
            CGContextClosePath(context)
            CGContextStrokePath(context)
            start_point = end_point
        }
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        image.drawInRect(self.bounds)
    }
    
    //メーターの変化値を取得するメソッド
    func getPlusParams(params:[Dictionary<String,AnyObject>]) -> (palams: [Dictionary<String,AnyObject>], movingMeter: String){
        var plusParams = [Dictionary<String,AnyObject>]()
        var meter: String!
        if((params[0]["value"]! as! Int) >= (_params[0]["value"]! as! Int)) {
            plusParams.append(["value":params[0]["value"]! as! Int,"color":UIColor.hex("a93c66", alpha: 1.0)])
            meter = "left"
        }
        else if ((params[0]["value"]! as! Int) <= (_params[0]["value"]! as! Int)) {
            plusParams.append(["value":params[1]["value"]! as! Int,"color":UIColor.hex("3ca97f", alpha: 1.0)])
            meter = "right"
        }
        return (plusParams, meter)
    }
    
    //増える方のグラフを上書きで描画するメソッド
    func drawPlusGraphView(rect: CGRect) {
        var start_point:CGFloat = sideMargin;
        var end_point:CGFloat = start_point;
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        //        self.getCurrentImage().drawInRect(self.bounds)
        
        for dic : Dictionary<String,AnyObject> in _params {
            let value = CGFloat(dic["value"] as! Float)
            print("This is value",value)
            start_point = _change_point
            end_point = maxMovingPoint
            if (currentUpMeter == "left") {
                if(end_point > _end_point) {
                    end_point = _end_point;
                }
            }
            else if (currentUpMeter == "right") {
                if(end_point < _end_point) {
                    end_point = _end_point;
                }
            }
            let color:UIColor = dic["color"] as! UIColor
            let cgColor:CGColorRef = color.CGColor
            CGContextSetStrokeColorWithColor(context, cgColor)
            CGContextSetLineWidth(context, contextHight)
            CGContextMoveToPoint(context, start_point, 0)
            CGContextAddLineToPoint(context, end_point, 0)
            CGContextClosePath(context)
            CGContextStrokePath(context)
            start_point = end_point
        }
    }
    
    //Viewの描画を行う
    override func drawRect(rect: CGRect) {
        if(isFirstDrawView == true) {
            drawFirstGraphView(rect)
        }
        else {
            self.getCurrentImage().drawInRect(self.bounds)
            drawPlusGraphView(rect)
        }
        isFirstDrawView = false
    }
}
