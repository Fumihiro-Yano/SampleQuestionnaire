//
//  BaseResultViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/26.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BaseResultViewController: UIViewController {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var meterGraphContentView: UIView!
    var graphView:MeterGraphView!;
//    var rightMeterLabel:UILabel!;
//    var leftMeterLabel:UILabel!;
    
    @IBOutlet weak var leftMeterLabel: UILabel!
    
    @IBOutlet weak var rightMeterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftImage.image = UIImage(named: Datacontent().getImageName(0, imageSide: 0))
        self.rightImage.image = UIImage(named: Datacontent().getImageName(0, imageSide: 1))
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        let meterGraphContentViewWidth = self.meterGraphContentView.frame.width
        //tabbarとCollectionViewの最後がかぶらないように
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
         var params = [Dictionary<String,AnyObject>]()
         params.append(["value":5,"color":UIColor.hex("a93c66", alpha: 1.0)])
         params.append(["value":5,"color":UIColor.hex("3ca97f", alpha: 1.0)])
         graphView = MeterGraphView(frame: CGRectMake(0, 0, meterGraphContentViewWidth, 40), params: params)
         print("this is graphView origin x : \(self.graphView.bounds.origin.x)")
         print("this is graphView width : \(self.graphView.bounds.width)")
         print("this is View width : \(self.view.bounds.width)")
         let rightCount:Int = 90
         let leftCount:Int = 10
         rightMeterLabel.text = "B \(rightCount)票"
         leftMeterLabel.text = "A \(leftCount)票"
         self.meterGraphContentView.addSubview(graphView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var params = [Dictionary<String,AnyObject>]()
        params.append(["value":1,"color":UIColor.hex("a93c66", alpha: 1.0)])
        params.append(["value":9,"color":UIColor.hex("3ca97f", alpha: 1.0)])
        graphView.startAnimating(params)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
