//
//  InteractiveTransitionController.swift
//  CustomNavigationTransition
//
//  Created by yoshi-kou on 2018/05/20.
//  Copyright © 2018 ysn551. All rights reserved.
//

import UIKit

class InteractiveTransitionController: UIPercentDrivenInteractiveTransition, UIGestureRecognizerDelegate {

    var contextData: UIViewControllerContextTransitioning?
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        print("\(type(of: self)).\(#function)")
        
        self.contextData = transitionContext
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(InteractiveTransitionController.handlePanGestureRecognizer))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self
        
        let containerView = transitionContext.containerView
        containerView.addGestureRecognizer(panGesture)
    }
    
    var ploc: CGPoint!
    
    @objc func handlePanGestureRecognizer(_ gesture: UIPanGestureRecognizer) {
        let containerView = self.contextData!.containerView
        let fromView = self.contextData!.view(forKey: .from)!
        
        switch gesture.state {
        case .began:
            ploc = gesture.location(in: containerView)
        case .changed:
            
            let loc = gesture.location(in: containerView)
            let dx = loc.x - ploc.x
            fromView.frame.origin.x += dx
            let movingWidth = containerView.frame.size.width - fromView.frame.origin.x
            let progress = movingWidth / containerView.frame.size.width
            ploc = loc
            self.update(progress)
        case .ended:
            if self.percentComplete >= 0.5 {
                self.finish()
            } else {
                
                self.cancel()
            }
            containerView.removeGestureRecognizer(gesture)
        default:
            self.cancel()
            break
        }
    }
    
    // MARK: - UIGesture Recognizer Delegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(type(of: self)).\(#function)")
        guard let _ = gestureRecognizer.view,
        let contextData = self.contextData else {
            return false
        }
        let containerView = contextData.containerView
        let location = gestureRecognizer.location(in: containerView)
        print("location = \(location)")
        if location.x < 40.0 {
            return true
        } else {
            return false
        }
    }
}
