//
//  NotificationVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit
import NavLib

class NotificationVC: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }
    
    // MARK: - Function
    func setupNav() {
        setNavigationBarStyle(
            isHidden: false,
            barTintColor: UIColor.cyan,
            titleConfig: NavigationTitleConfig(title: "Notification"),
            leftButtons: [
                NavigationButtonConfig(image: UIImage(named: "profile"), selector: #selector(handleProfile))
            ],
            rightButtons: [
                NavigationButtonConfig(titleConfig: ButtonTitleConfig(title: "Read All"), selector: #selector(handleReadAll))
            ]
        )
        
    }
    
    // MARK: - OBJC
    @objc func handleReadAll(_ sender: UIButton) {
        animateButton(sender) {
            print("✅ Read All tapped")
        }
        
    }
}
