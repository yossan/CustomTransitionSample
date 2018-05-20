//
//  DetailViewController.swift
//  CustomNavigationTransition
//
//  Created by yoshi-kou on 2018/05/19.
//  Copyright © 2018 ysn551. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func onBt(_ sender: Any) {
        self.dismiss(animated: true) {
            print("completion")
        }
    }

    override func loadView() {
        
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view didload frame = \(self.view.frame)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view willappear frame = \(self.view.frame)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         print("view willlayout frame = \(self.view.frame)")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         print("view didLayoutSubviews frame = \(self.view.frame)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition size: \(size)")
        print("coordinator: \(coordinator)")
    }
    
    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        print("size container: \(container), size:\(parentSize)")
        
        
        return CGSize(width: 100.0, height: 100.0)
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        print("DetailViewController preferedInterfaceOrientation")
        return .landscapeRight
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        print("DetailViewController supportedInterfaceOrientations")
        return .landscapeRight
    }
    
}
