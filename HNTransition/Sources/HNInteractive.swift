//
//  HNInteractive.swift
//  HNTransition
//
//  Created by oneweek on 3/24/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

enum interactiveTransitionState {
    case none
    case process
    case completed
}

class HNInteractive: UIPercentDrivenInteractiveTransition {
    var process : CGFloat = 0.0
    var state : interactiveTransitionState = .none
    
    private weak var viewController : UIViewController!
    
    func addGestures(vc : UIViewController){
        self.viewController = vc
        configGestures(view: vc.view)
    }
    
    func configGestures(view:UIView){
        let ges = UIScreenEdgePanGestureRecognizer(target: self , action: #selector(gesture(pan:)))
        ges.edges = .left
        view.addGestureRecognizer(ges)
    }
    
    
    func gesture(pan : UIScreenEdgePanGestureRecognizer){
        let translation = pan.translation(in: pan.view!.superview!)
        var progress = (translation.x / 200)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch pan.state {
        case .began:
            self.state = .process
            _ = self.viewController.navigationController?.popViewController(animated: true)
            break
            
        case .changed :
            self.process = progress
            update(progress)
            break
            
        case .cancelled :
            cancel()
            self.state = .none
            break
            
        case .ended :
            
            self.state = .none
            if self.process > 0.5 {
                finish()
            }else{
                cancel()
            }
            break
            
        default:
            print("un support")
        }
        
    }
}
