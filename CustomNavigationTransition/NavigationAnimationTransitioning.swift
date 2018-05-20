//
//  NavigationAnimationTransitioning.swift
//  CustomNavigationTransition
//
//  Created by yoshi-kou on 2018/05/19.
//  Copyright © 2018 ysn551. All rights reserved.
//

import Foundation
import UIKit

class NavigationAnimationTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting: Bool
    init(presenting: Bool) {
        self.isPresenting = presenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if self.isPresenting {
            return 0.25
        } else {
            return 0.5
        }
    }
    
    // このメソッド内でViewControllerのviewの入れ替えを行う
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if self.isPresenting {
            self.presentTransition(using: transitionContext)
        } else {
            self.dismissTransition(using: transitionContext)
        }
    }
    
    func presentTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: .from)!.view!
        let toView = transitionContext.view(forKey: .to)!
        
        let screenRect = containerView.frame
        let startFrame = CGRect(x:0.0, y: -1.0 * screenRect.size.height, width: screenRect.size.width, height: screenRect.size.height)
        toView.frame = startFrame
        containerView.addSubview(toView)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
            fromView.frame.origin.y += 30
            toView.frame = screenRect
            
        }) { (finished) in
            transitionContext.completeTransition(true)
            fromView.frame.origin.y = 0
        }
        
//
//        let fromCoordinator = transitionContext.viewController(forKey: .from)!.transitionCoordinator
//        fromCoordinator?.animateAlongsideTransition(in: containerView, animation: { (coordinatorCtx) in
//            let fromVC = coordinatorCtx.viewController(forKey: .from)
//            let toVC = coordinatorCtx.viewController(forKey: .to)
//            let fromView = coordinatorCtx.view(forKey: .from)
//            let toView = coordinatorCtx.view(forKey: .to)
//
//            print("fromVC = \(fromVC)")
//            print("toVC = \(toVC)")
//            print("fromView = \(fromView)")
//            print(("toView = \(toView)"))
//
//            print("animate alongsideTransition was called")
//        }, completion: { (coordinatorCtx) in
//            print("animate alongsideTransition was completioned")
//        })
//        fromCoordinator?.animate(alongsideTransition: { (coordinatorCtx) in
//
//        }, completion: { (coordinatorCtx) in
//
//
//        })
    }
    
    func dismissTransition(using context: UIViewControllerContextTransitioning) {
        let containerView = context.containerView
        let fromView = context.view(forKey: .from)! //presented 即座にリムーブされる
        let snapFromView = fromView.snapshotView(afterScreenUpdates: false)!
        snapFromView.layer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Double.pi/2.0)))
        snapFromView.frame.origin = CGPoint.zero
//        snapFromView.transform = fromView.transform
        
        let toView = context.view(forKey: .to)! // presenting
        
        toView.frame = containerView.bounds
//        toView.frame.origin.y -= 30
        containerView.addSubview(toView)
        containerView.addSubview(snapFromView)
        
        UIView.animate(withDuration: 0.5, animations: {
           snapFromView.frame.origin.y = containerView.frame.size.height
        }, completion: { (finished) in
            snapFromView.removeFromSuperview()
            context.completeTransition(true)
        })
    }
}
