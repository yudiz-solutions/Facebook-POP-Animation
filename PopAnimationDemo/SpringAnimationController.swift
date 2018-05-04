//
//  SpringAnimationController.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 16/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

class SpringAnimationController: UIViewController {

    /// IBOutlets
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var ballCenterYConstraint: NSLayoutConstraint!
    
    /// Variables
    var bounciness: CGFloat = 8.0
    var atTop: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - UI Related
extension SpringAnimationController {
    
    func prepareUI() {
        self.navigationItem.title = "Spring Animation"
        ballView.layer.cornerRadius = ballView.frame.size.width/2
        ballView.layer.masksToBounds = true
        slider.minimumValue = 8.0
        slider.maximumValue = 20.0
    }
}

// MARK: - Other Methods
extension SpringAnimationController {
    
    func animateTop() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring?.toValue = 100
        spring?.springBounciness = bounciness
        spring?.springSpeed = 8
        ballCenterYConstraint.pop_add(spring, forKey: "moveUp")
    }
    
    func animateBottom() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring?.toValue = -100
        spring?.springBounciness = bounciness
        spring?.springSpeed = 8
        ballCenterYConstraint.pop_add(spring, forKey: "moveDown")
    }
}

// MARK: - IBActions
extension SpringAnimationController {

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        bounciness = CGFloat(slider.value)
    }

    @IBAction func btnAnimationTap(_ sender: UIButton) {
        if atTop {
            animateBottom()
        } else {
            animateTop()
        }
        atTop = !atTop
    }
}
