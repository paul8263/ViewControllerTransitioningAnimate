//
//  SecondViewControllerAnimator.swift
//  ViewTransitioningAnimate
//
//  Created by Paul Zhang on 27/02/2016.
//  Copyright © 2016 Paul. All rights reserved.
//

import UIKit

class SecondViewControllerAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var isEntering: Bool = true

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        
        if isEntering {
            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
//            Get the final frame(final position and size) for toView
            toView.frame = transitionContext.finalFrameForViewController(toViewController)
            
            toView.center.y -= containerView!.frame.height
//            Add toView to the container view
//            Do not forget this step
            containerView?.addSubview(toView)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                toView.center.y += containerView!.frame.height
                }) { (finished) -> Void in
                    transitionContext.completeTransition(finished)
            }
        } else {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                fromView.center.y += containerView!.frame.height
                }) { (finished) -> Void in
                    transitionContext.completeTransition(finished)
            }
        }
        
        
        
        
    }
}
