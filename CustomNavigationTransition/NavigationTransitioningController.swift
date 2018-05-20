//
//  NavigationTransitioningController.swift
//  CustomNavigationTransition
//
//  Created by yoshi-kou on 2018/05/19.
//  Copyright © 2018 ysn551. All rights reserved.
//

import Foundation
import UIKit

class NavigationTransitioningController: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - For Animation Transition
    
    // optional
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // transition animator object
//        print("presenting: \(presenting)")
//        print("source: \(source)")
//        return nil
        return NavigationAnimationTransitioning(presenting: true)
    }
    
    // optional
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print("dismissed: \(dismissed)")
        return NavigationAnimationTransitioning(presenting: false)
    }
    
    // MARK: - For Intaractive Transition
    
    // optional
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        // interactive animator object
//        
//    }
//    
//    // optional
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        print("\(type(of: self)).\(#function)")
        
        return InteractiveTransitionController()
    }
    
}
