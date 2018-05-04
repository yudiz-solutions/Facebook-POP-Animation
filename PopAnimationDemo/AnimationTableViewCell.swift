//
//  AnimationTableViewCell.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 18/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

/// UITableViewCell
class AnimationTableViewCell: UITableViewCell {
    
    /// IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if self.tag == 3 {
            if highlighted {
                print(isHighlighted)
                let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
                scaleAnimation?.duration = 0.1// defaults to 0.4
                scaleAnimation?.toValue = NSValue(cgPoint: CGPoint(x: 1.0, y: 1.0))
                scaleAnimation?.roundingFactor = 1.0
                self.lblTitle.pop_add(scaleAnimation, forKey: "scaleAnimation")
            } else {
                print(isHighlighted)
                let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
                springAnimation?.toValue = NSValue(cgPoint: CGPoint(x: 0.9, y: 0.9))
                springAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 2.0, y: 2.0))
                springAnimation?.springBounciness = 20.0//from 1 to 20
                self.lblTitle.pop_add(springAnimation, forKey: "springAnimation")
            }
        }
    }
}
