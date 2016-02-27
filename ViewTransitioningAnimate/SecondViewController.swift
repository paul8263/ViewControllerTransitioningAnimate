//
//  SecondViewController.swift
//  ViewTransitioningAnimate
//
//  Created by Paul Zhang on 27/02/2016.
//  Copyright © 2016 Paul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func dismissButtonClicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        You must set these in init() method
//        In viewDidLoad it will not work
        self.transitioningDelegate = self
        self.modalPresentationStyle = .Custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SecondViewController: UIViewControllerTransitioningDelegate {
//    Set the background dimming view
//    PresentationController is for setting things other than fromView and toView
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return DimmingViewPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
//    Set the animator for showing the secondView
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let secondViewControllerAnimator = SecondViewControllerAnimator()
        secondViewControllerAnimator.isEntering = true
        return secondViewControllerAnimator
    }
//    Set the animator for dismissing the secondView
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let secondViewControllerAnimator = SecondViewControllerAnimator()
        secondViewControllerAnimator.isEntering = false
        return secondViewControllerAnimator
    }
}