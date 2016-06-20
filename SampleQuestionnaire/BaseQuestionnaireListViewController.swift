//
//  BaseQuestionnaireList.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/05/10.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

let reuseIdentifier = "BaseQuestionnaireListCollectionViewCell"
let cellHorizontalMargin:CGFloat = 10.0
let cellVerticalMargin:CGFloat = 5.0


class BaseQuestionnaireListViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var questionArray : [String] = ["【ご当地メンズ】どちらの男性がかっこいい？？","【ゲット】仲間にするなら？？", "【ことわざ】木から落ちるのは？？", "【駄菓子】アマゾンで頼むなら？？", "【今日のオススメ】スカッとする映画は？？", "【美女判定】美人なのはどっち？？", "【海外俳優】付き合うなら", "【学習言語】勉強するならどっち？？", "【ケーキ対決】作るならどっち？？"]
    var photo1NameArray : [String] = ["left.jpg","2_1.jpg", "3_1.jpg", "4_1.jpg", "5_1.jpg", "6_1.jpg", "7_1.jpg", "8_1.jpg", "9_1.jpg"]
    var photo2NameArray : [String] = ["right.jpg","2_2.jpg", "3_2.jpg", "4_2.jpg", "5_2.jpg", "6_2.jpg", "7_2.jpg", "8_2.jpg", "9_2.jpg"]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var questionnaireCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionnaireCollectionView.registerNib(UINib(nibName: "BaseQuestionnaireListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        questionnaireCollectionView.delegate = self
        questionnaireCollectionView.dataSource = self
        
        // CollectionView のコンテンツに余白を付ける（下50px）
        questionnaireCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        // CollectionView のスクロール可能範囲に余白を付ける（下50px）
        questionnaireCollectionView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        //tabbarとCollectionViewの最後がかぶらないように
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        headerView.layer.zPosition = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    //セルの大きさをきめるメソッド
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //セルのwidthは端末に合わせて計算。
        let cellWidth:CGFloat = self.view.frame.width - 2*cellHorizontalMargin
        let cellHight:CGFloat = cellWidth/2 + 50
        return CGSizeMake(cellWidth, cellHight)
    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellVerticalMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellHorizontalMargin
    }
    
    
    //セルのテキストや色を指定するメソッド
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : BaseQuestionnaireListCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BaseQuestionnaireListCollectionViewCell
        let LeftImage = UIImage(named: photo1NameArray[indexPath.row])
        let RightImage = UIImage(named: photo2NameArray[indexPath.row])
        cell.collectionViewLeftImage.image = LeftImage
        cell.collectionViewRightImage.image = RightImage
        cell.collectionViewQuestionnaireLabel.text = questionArray[indexPath.row]
        //cellに影をつける
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        cell.layer.shadowOpacity = 0.9
        cell.layer.shadowRadius = 1.0
        return cell
    }

}