//
//  AnimationTableViewController.swift
//  PopAnimationDemo
//
//  Created by Yudiz Solutions Pvt Ltd on 13/04/18.
//  Copyright © 2018 Yudiz Solutions Pvt Ltd. All rights reserved.
//

import UIKit
import pop

/// UIViewController
class AnimationTableViewController: UIViewController {

    /// IBOutlet
    @IBOutlet weak var tabelView: UITableView!
    
    // Data Array
    var arrPOPAnimations: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - UI Related
extension AnimationTableViewController {
    
    func prepareUI() {
        self.navigationItem.title = "Facebook POPAnimation"
        /// Data Related
        prepareForData()
    }
}


// MARK: - Data Related
extension AnimationTableViewController {
    
    func prepareForData() {
        arrPOPAnimations.append("Basic Animation")
        arrPOPAnimations.append("Spring Animation")
        arrPOPAnimations.append("Decay Animation")
        arrPOPAnimations.append("Example Highlighted Cell")
        tabelView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AnimationTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPOPAnimations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimationTableViewCell
        cell.tag = indexPath.row
        cell.lblTitle.text = arrPOPAnimations[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "basicAnimationSegue", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "springAnimationSegue", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "decayAnimationSegue", sender: nil)
        } 
    }
}

