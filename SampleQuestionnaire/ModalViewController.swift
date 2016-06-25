//
//  ModalViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/22.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var checkingImageView: UIImageView!
    private var indexRow: Int?
    private var selecedImageTag: Int?
    var indexRowAccessor: Int? {
        get {
            return self.indexRow
        }
        set(value) {
            self.indexRow = value
        }
    }
    var selecedImageTagAccessor: Int? {
        get {
            return self.selecedImageTag
        }
        set(value) {
            self.selecedImageTag = value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedImageView.image = UIImage(named: Datacontent().getImageName(self.indexRow!, imageSide: self.selecedImageTag!))
        let checkingImage = UIImage(named: "checking.png")
        self.checkingImageView.image = checkingImage
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            UIImageView.animateWithDuration(0.5) { () -> Void in
                self.checkingImageView.alpha = 1.0
            }
        
        // アニメーションの時間を0.5秒に設定.
        UIImageView.animateWithDuration(0.5,
            animations: { () -> Void in
                // 縮小用アフィン行列を作成.
                self.checkingImageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
            }) // 連続したアニメーション処理.
            { (Bool) -> Void in
                UIImageView.animateWithDuration(0.5,
                    // アニメーション中の処理.
                    animations: { () -> Void in
                        // 拡大用アフィン行列を作成.
                        self.checkingImageView.transform = CGAffineTransformMakeScale(1, 1)
                    }) // アニメーション完了時の処理.
                    { (Bool) -> Void in
                        // 大きさを元に戻す.
                        self.checkingImageView.transform = CGAffineTransformMakeScale(1, 1)
                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
