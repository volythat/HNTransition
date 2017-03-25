//
//  HNTransition.swift
//  HNTransition
//
//  Created by oneweek on 3/23/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.main.bounds

class HNTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var leftFrame = CGRect(x: -screenSize.width, y: 0, width: screenSize.width, height: screenSize.height)
    var rightFrame = CGRect(x: screenSize.width, y: 0, width: screenSize.width, height: screenSize.height)
    var centerFrame = screenSize
    var isPresenting : Bool = false
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
        if self.isPresenting == true {
            toVC?.view.frame = rightFrame
            
            containerView.addSubview(toVC!.view)
            
            UIView.animate(withDuration: duration, animations: {
                
                toVC?.view.frame = self.centerFrame
                fromVC?.view.frame = self.leftFrame
                
            }, completion: { (finish) in
                fromVC?.view.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }else{
            containerView.insertSubview(toVC!.view, belowSubview: fromVC!.view)
            toVC?.view.frame = leftFrame
            
            UIView.animate(withDuration: duration, animations: {
                fromVC?.view.frame = self.rightFrame
                toVC?.view.frame = self.centerFrame
            }) { (finish) in
                if transitionContext.transitionWasCancelled == true {
                    toVC?.view.removeFromSuperview()
                }else{
                    fromVC?.view.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
