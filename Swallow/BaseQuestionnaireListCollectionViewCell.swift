//
//  BaseQuestionnaireListCollectionViewCell.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/05/10.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BaseQuestionnaireListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewRightImage: UIImageView!
    @IBOutlet weak var collectionViewLeftImage: UIImageView!
    @IBOutlet weak var collectionViewQuestionnaireLabel: UILabel!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
