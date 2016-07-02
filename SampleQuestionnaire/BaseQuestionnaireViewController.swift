//
//  BaseQuestionnaireViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/20.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class BaseQuestionnaireViewController: UIViewController {
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var pushModalViewButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    //動かすために一旦仮
    var tappedImage: UIImageView?
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
        self.leftImage.image = UIImage(named: Datacontent().getImageName(self.indexRow!, imageSide: 0))
        self.rightImage.image = UIImage(named: Datacontent().getImageName(self.indexRow!, imageSide: 1))
        self.titleLabel.text = Datacontent().getTitle(self.indexRow!)
        self.descriptionTextView.text = Datacontent().getQuestionDescription(self.indexRow!)
        //xibで指定した
      //self.descriptionTextView.editable = false
        leftImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
        rightImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        //tabbarとCollectionViewの最後がかぶらないように
        if self.respondsToSelector("edgesForExtendedLayout") {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.descriptionTextView.setContentOffset(CGPointZero, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openButtonTouchUpInside(sender: AnyObject) {
        let lineupModalViewController = lineUpModalViewController()
        lineupModalViewController.modalPresentationStyle = .Custom
        lineupModalViewController.transitioningDelegate = self
        presentViewController(lineupModalViewController, animated: true, completion: nil)
    }
    
    //imageのタップイベント
    func imageTapped(sender: UITapGestureRecognizer) {
        let selectedTag: Int = sender.view!.tag
        switch selectedTag {
        case 0:
            tappedImage = leftImage
        case 1:
            tappedImage = rightImage
        default :
            tappedImage = leftImage
        }
        
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .Custom
        modalViewController.transitioningDelegate = self
        modalViewController.indexRowAccessor = self.indexRow
        modalViewController.selecedImageTagAccessor = selectedTag
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    func pushBaseQuestionnaireResultViewController() {
        let baseQuestionnaireResultViewController: BaseQuestionnaireResultViewController = BaseQuestionnaireResultViewController()
        baseQuestionnaireResultViewController.indexRowAccessor = self.indexRow
        self.navigationController!.pushViewController(baseQuestionnaireResultViewController, animated: true)
    }
}

extension BaseQuestionnaireViewController: UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}

extension BaseQuestionnaireViewController {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimatedTransitioning(isPresent: true, imgView:
        tappedImage)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.pushBaseQuestionnaireResultViewController()
        return CustomAnimatedTransitioning(isPresent: false, imgView: tappedImage)
    }
}
