//
//  HNNavigationController.swift
//  HNTransition
//
//  Created by oneweek on 3/25/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

class HNNavigationController: UINavigationController,UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    
    let animator = HNTransition()
    let interactive = HNInteractive()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.animator.isPresenting = operation == .push
        toVC.transitioningDelegate = self
        self.interactive.addGestures(vc: toVC)
        return self.animator
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive.state == .process ? self.interactive : nil
    }
}
