//
//  AvatarBackgroundCollectionReusableView.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/07/27.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

protocol avatarBackgroundCollectionReusableViewDelegate: class {
    func changeCollectionViewCell(selectedSegmentIndex: Int)
}

class AvatarBackgroundCollectionReusableView: UICollectionReusableView {

    weak var delegate: avatarBackgroundCollectionReusableViewDelegate?
    @IBOutlet weak var myPageCollectionViewCellSegmentedControl: UISegmentedControl!
    @IBOutlet weak var avatarBackgroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let avatarBackgroundImage = UIImage(named: "avaterbackground.png")
        self.avatarBackgroundImageView.image = avatarBackgroundImage
        
        let avatarImage = UIImage(named: "avatar.jpg")
        self.avatarImageView.image = avatarImage
        
        //AvaterImageViewを丸くして白い縁で囲む
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.borderWidth = 5
        self.avatarImageView.layer.borderColor = UIColor.hex("FFFFFF", alpha: 1.0).CGColor
        
        print("selectedSegmentIndex = \(myPageCollectionViewCellSegmentedControl.selectedSegmentIndex)")
    }
    
    @IBAction func selectedSegmentControl(sender: AnyObject) {
        print("sender = \(sender.selectedSegmentIndex)")
        self.delegate?.changeCollectionViewCell(sender.selectedSegmentIndex)
    }
}
