//
//  BasicAnimationController.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 16/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

class BasicAnimationController: UIViewController {
    
    /// IBOutlet
    @IBOutlet weak var animView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - UI Related
extension BasicAnimationController {
    
    func prepareUI() {
        self.navigationItem.title = "Basic Animation"
    }
}

// MARK: - Other Methods
extension BasicAnimationController {
    
    func prepareForBasicAnimation() {
        if let _ = animView.layer.pop_animation(forKey: "basicAnimation") as? POPBasicAnimation {
            return
        }
        let anim = POPBasicAnimation(propertyNamed: kPOPLayerRotation)
        anim?.fromValue = 0
        anim?.toValue = Double.pi
        anim?.duration = 0.5
        animView.layer.pop_add(anim, forKey: "basicAnimation")
    }
}

// MARK: - IBActions
extension BasicAnimationController {
    
    @IBAction func btnAnimationTap(_ sender: UIButton) {
        prepareForBasicAnimation()
    }
}
