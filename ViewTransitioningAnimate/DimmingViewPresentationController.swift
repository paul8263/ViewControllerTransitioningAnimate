//
//  DimmingViewPresentationController.swift
//  ViewTransitioningAnimate
//
//  Created by Paul Zhang on 27/02/2016.
//  Copyright © 2016 Paul. All rights reserved.
//

import UIKit

class DimmingViewPresentationController: UIPresentationController {
//    Initialise the dim view
    lazy var dimView = DimView(frame: CGRect.zero)
//    Do not remove the first view
//    It will show as the background
    override func shouldRemovePresentersView() -> Bool {
        return false
    }
    override func presentationTransitionWillBegin() {
        dimView.alpha = 0
        dimView.frame = containerView!.bounds
        containerView!.insertSubview(dimView, atIndex: 0)
        let coordinator = presentedViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ (_) -> Void in
            self.dimView.alpha = 1
            }, completion: nil)
    }
    override func dismissalTransitionWillBegin() {
        let coordinator = presentedViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ (_) -> Void in
            self.dimView.alpha = 0
            }, completion: nil)
    }
}
