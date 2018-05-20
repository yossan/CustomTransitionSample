//
//  ViewController.swift
//  CustomNavigationTransition
//
//  Created by yoshi-kou on 2018/05/19.
//  Copyright © 2018 ysn551. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let  transitioning = NavigationTransitioningController()
    
    @IBAction func onBt(_ sender: Any) {
//        self.modalPresentationStyle = .custom
        let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController")
        
        detailVC.transitioningDelegate = transitioning
//        self.transitioningDelegate = transitioning
        
        detailVC.modalPresentationStyle = .fullScreen
//        self.show(detailVC, sender: self)
//        self.showDetailViewController(detailVC
//            , sender: self)
        self.present(detailVC, animated: true) {
            print("present show")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination
        destVC.transitioningDelegate = transitioning
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        print("ViewController preferedInterfaceOrientation")
        return .portrait
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        print("ViewController supportedInterfaceOrientations")
        return .portrait
    }
    
    
    
}

