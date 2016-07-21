//
//  ViewController.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/05/09.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var graphView:PieGraphView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        var params = [Dictionary<String,AnyObject>]()
        params.append(["value":5,"color":UIColor.redColor()])
        params.append(["value":5,"color":UIColor.blueColor()])
        graphView = PieGraphView(frame: CGRectMake(0, 30, 320, 320), params: params)
        self.view.addSubview(graphView)
        graphView.startAnimating()
        self.navigationItem.title = "タイトル"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func start(sender: AnyObject) {
//        graphView.startAnimating()
//        
//    }

}

