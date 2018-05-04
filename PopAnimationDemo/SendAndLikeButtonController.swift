//
//  SendAndLikeButtonController.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 16/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

/// UIViewController
class SendAndLikeButtonController: UIViewController {

    /// IBOutlets
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var tfInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - UI Related
extension SendAndLikeButtonController {
    
    func prepareUI() {
        self.navigationItem.title = "Send & Like Animation"
        btnLike.isHidden = false
        btnSend.isHidden = true
    }
}

// MARK: - Other Methods
extension SendAndLikeButtonController {
    
    func showLike() {
        btnLike.isHidden = false
        btnSend.isHidden = true
        let spin = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
        spin?.fromValue = (Double.pi / 4)
        spin?.toValue = 0
        spin?.springBounciness = 20
        spin?.velocity = 10
        spin?.delegate = self
        btnLike.layer.pop_add(spin, forKey: "likeAnimation")
    }
    
    func showSend() {
        btnLike.isHidden = true
        btnSend.isHidden = false
        let sprintAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        sprintAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 8.0, y: 8.0))
        sprintAnimation?.springBounciness = 20.0
        sprintAnimation?.name = "send"
        sprintAnimation?.delegate = self
        btnSend.pop_add(sprintAnimation, forKey: "sendAnimation")
    }
}

// MARK: - IBActions
extension SendAndLikeButtonController {
    
    @IBAction func tfEditingChanged(_ sender: UITextField) {
        if let str = sender.text {
            if str.isEmpty {
                //Show like
                showLike()
            } else {
                //Show Send
                showSend()
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension SendAndLikeButtonController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

// MARK: - POPAnimationDelegate
extension SendAndLikeButtonController: POPAnimationDelegate {
    
    // Called on animation start.
    func pop_animationDidStart(_ anim: POPAnimation!) {
        if anim.name == "send" {
            // perform a new animation or action
        }
    }
    
    // Called when value meets or exceeds to value.
    func pop_animationDidReach(toValue anim: POPAnimation!) {
        if anim.name == "send" {
            // perform a new animation or action
        }
    }
    
    // Called on animation stop.
    func pop_animationDidStop(_ anim: POPAnimation!, finished: Bool) {
        if anim.name == "send" {
            // perform a new animation or action
        }
    }
    
    // Called each frame animation is applied
    func pop_animationDidApply(_ anim: POPAnimation!) {
        if anim.name == "send" {
            // perform a new animation or action
        }
    }
}
