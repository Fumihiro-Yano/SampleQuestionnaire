//
//  BasePostQuestionViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/07/03.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BasePostQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var postQuestionTableView: UITableView!
    private let sectionTitles: NSArray = ["画像を入力", "質問タイトルを入力","質問内容を入力"]
    var basePostQuestionHeaderView: BasePostQuestionHeaderView!
    let basePostQuestionHeaderViewHight: CGFloat = 200
    let basePostQuestionSessionContentHight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postQuestionTableView.dataSource = self
        postQuestionTableView.delegate = self
        self.basePostQuestionHeaderView = BasePostQuestionHeaderView()
        self.basePostQuestionHeaderView.delegate = self
        self.basePostQuestionHeaderView.postLeftImageView.image = UIImage(named: "selectImage.png")
        self.basePostQuestionHeaderView.postRightImageView.image = UIImage(named: "selectImage.png")
        //cellの定義
        self.postQuestionTableView.registerNib(UINib(nibName: "BasePostQuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "BasePostQuestionTableViewCell")
        self.postQuestionTableView.registerNib(UINib(nibName: "BasePostQuestionCategoryTableViewCell",bundle: nil), forCellReuseIdentifier: "BasePostQuestionCategoryTableViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController/viewDidDisappear/別の画面に遷移した直後")
        self.basePostQuestionHeaderView.label.text = ""
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ヘッダーの設定
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch(section) {
        case 0:
            self.basePostQuestionHeaderView.label.text = "タイトルを入力"
            return self.basePostQuestionHeaderView
        default:
            let myView: UIView = UIView()
            return myView
        }
    }
    
    //ヘッダーの高さを返す
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return self.basePostQuestionHeaderViewHight
        }
        else {
            return self.basePostQuestionSessionContentHight
        }
    }
    
    //セッションのタイトルを返す
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section] as? String
    }
    
    //セクションの数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    //テーブルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
          case 0:
            return 1;
        default:
            return 2;
        }
    }
    
    //テーブルセルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch(indexPath.section) {
          case 0:
            let titleCell : BasePostQuestionTableViewCell = tableView.dequeueReusableCellWithIdentifier("BasePostQuestionTableViewCell") as! BasePostQuestionTableViewCell
            return titleCell
          default:
            let categoryCell : BasePostQuestionCategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("BasePostQuestionCategoryTableViewCell") as! BasePostQuestionCategoryTableViewCell
            return categoryCell
        }
    }
    
    //スクロール時
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
    }
    
    //セルの高さを返す
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      switch(indexPath.section) {
        case 0:
            return 200;
        default:
            return 50;
        }
    }
    
    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    }
}

extension BasePostQuestionViewController: BasePostQuestionHeaderViewDelegate {
    func setHeaderViewHight() -> CGFloat {
        return self.basePostQuestionHeaderViewHight
    }
    func setHeaderViewWidth() -> CGFloat {
        return self.view.frame.size.width
    }
    
    func tapHeaderViewImage() {
        print("print_print")
        let cameraCaptureViewController = CameraCaptureViewController()
        let navigationController = UINavigationController(rootViewController: cameraCaptureViewController)
        presentViewController(navigationController, animated: true, completion: nil)
    }
}