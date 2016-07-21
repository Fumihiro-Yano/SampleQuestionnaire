//
//  BasePostQuestionHeaderView.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/07/05.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

protocol BasePostQuestionHeaderViewDelegate: class {
    func setHeaderViewHight() -> CGFloat
    func setHeaderViewWidth() -> CGFloat
    func tapHeaderViewImage()
}

class BasePostQuestionHeaderView: UIView {    
    @IBOutlet var headerView: UIView!
    weak var delegate: BasePostQuestionHeaderViewDelegate?
    var headerHeight: CGFloat!
    var headerWidth: CGFloat!
    @IBOutlet weak var postLeftImageView: UIImageView!
    @IBOutlet weak var postRightImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // xibファイル読み込み
        NSBundle.mainBundle().loadNibNamed("BasePostQuestionHeaderView", owner: self, options: nil)
        }
    
    //新しいSuperviewに対してaddSubviewされる前(ライフサイクル)
    override func willMoveToSuperview(newSuperview: UIView?) {
        self.headerHeight = self.delegate?.setHeaderViewHight()
        self.headerWidth = self.delegate?.setHeaderViewWidth()
        
        // Viewの大きさを定義
        bounds = CGRectMake(0, 0, self.headerWidth, self.headerHeight)
        headerView.frame = bounds
        
        //タップイベントの設定
        self.headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BasePostQuestionHeaderView.imageTapped(_:))))
        self.headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BasePostQuestionHeaderView.imageTapped(_:))))
        
        // xibファイルのViewをカスタムViewクラスに追加する
        addSubview(headerView)
    }
    
    //imageのタップイベント
    func imageTapped(sender: UITapGestureRecognizer) {
//        let selectedTag: Int = sender.view!.tag
        self.delegate?.tapHeaderViewImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

