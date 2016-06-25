//
//  CustomAnimatedTransitioning.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/22.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//
import UIKit

final class CustomAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresent: Bool
    let imgView: UIImageView
    
    init(isPresent: Bool, imgView: UIImageView?) {
        self.isPresent = isPresent
        self.imgView = imgView ?? UIImageView(frame: CGRectZero)
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animatePresentTransition(transitionContext)
        } else {
            animateDissmissalTransition(transitionContext)
        }
    }
    
    // 表示する時のアニメーション
    func animatePresentTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let presentingController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let containerView = transitionContext.containerView()
            else {
                return
        }
        
        presentedController.view.layer.cornerRadius = 4.0
        presentedController.view.clipsToBounds = true
        presentedController.view.alpha = 0.0
        presentedController.view.transform = CGAffineTransformMakeScale(0.01, 0.01)
        
        containerView.insertSubview(presentedController.view, belowSubview: presentingController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .CurveLinear, animations: {
            presentedController.view.alpha = 1.0
            // 一旦、画像の真ん中から出てくるように3/2としている。
            presentedController.view.frame.origin.x = containerView.bounds.size.width - self.imgView.frame.origin.x/2
            presentedController.view.frame.origin.y = containerView.bounds.size.height - self.imgView.frame.origin.y * 3/2
            presentedController.view.transform = CGAffineTransformIdentity
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
    }
    
    // 非表示する時のアニメーション
    func animateDissmissalTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else {
            return
        }
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .CurveLinear, animations:{
            presentedController.view.alpha = 0.0
            presentedController.view.transform = CGAffineTransformMakeScale(0.01, 0.01)
            presentedController.view.frame.origin.x = self.imgView.frame.origin.x * 2
            presentedController.view.frame.origin.y = self.imgView.frame.origin.y * 3/2
            
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
    }
}
