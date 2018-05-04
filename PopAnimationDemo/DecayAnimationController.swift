//
//  DecayAnimationController.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 16/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

class DecayAnimationController: UIViewController {

    /// IBOutlets
    @IBOutlet weak var ballView: UIView!
    
    @IBOutlet weak var ballCenterY: NSLayoutConstraint! // 160 default

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UI Related
extension DecayAnimationController {
    
    func prepareUI() {
        self.navigationItem.title = "Decay Animation"
        ballView.layer.cornerRadius = ballView.frame.size.width/2
        ballView.layer.masksToBounds = true
    }
}

// MARK: - Other Methods
extension DecayAnimationController {
    
    func animateView() {
        let spring = POPDecayAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring?.velocity = NSValue(cgPoint: CGPoint(x: -642.0, y: 0))
        ballCenterY.pop_add(spring, forKey: "moveRight")
    }
    
    func resetConstraints() {
        ballCenterY.constant = 160
    }
}

// MARK: - IBActions
extension DecayAnimationController {
    
    @IBAction func btnAnimationTap(_ sender: UIButton) {
        resetConstraints()
        animateView()
    }
}

