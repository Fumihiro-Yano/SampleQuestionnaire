//
//  BaseQuestionnaireResultViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/07/02.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BaseQuestionnaireResultViewController: UIViewController {
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var meterGraphContentView: UIView!
    @IBOutlet weak var leftMeterLabel: UILabel!
    @IBOutlet weak var rightMeterLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var graphView:MeterGraphView!
    private var indexRow: Int?
    var indexRowAccessor: Int? {
        get {
            return self.indexRow
        }
        set(value) {
            self.indexRow = value
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItemの戻るボタンを消す
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "結果発表"
        //画像の設定
        self.leftImage.image = UIImage(named: Datacontent().getImageName(self.indexRow!, imageSide: 0))
        self.rightImage.image = UIImage(named: Datacontent().getImageName(self.indexRow!, imageSide: 1))
        self.titleLabel.text = Datacontent().getTitle(self.indexRow!)
        let meterGraphContentViewWidth = self.meterGraphContentView.frame.width
        var params = [Dictionary<String,AnyObject>]()
        params.append(["value":5,"color":UIColor.hex("a93c66", alpha: 1.0)])
        params.append(["value":5,"color":UIColor.hex("3ca97f", alpha: 1.0)])
        graphView = MeterGraphView(frame: CGRectMake(0, 0, meterGraphContentViewWidth, 80), params: params)
        let leftCount:Int = 10
        let rightCount:Int = 90
        leftMeterLabel.text = "A \(leftCount)票"
        rightMeterLabel.text = "B \(rightCount)票"
        self.meterGraphContentView.addSubview(graphView)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        //tabbarとCollectionViewの最後がかぶらないように
        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
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
