//
//  OverviewVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit
import NavLib

class OverviewVC: UIViewController {
    
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
            titleConfig: NavigationTitleConfig(title: "Overview"),
            leftButtons: [
                NavigationButtonConfig(image: UIImage(named: "profile"), selector: #selector(handleProfile))
            ],
            rightButtons: [
                NavigationButtonConfig(image: UIImage(named: "favorite"), selector: #selector(handleFavorite)),
                NavigationButtonConfig(image: UIImage(named: "gear"), selector: #selector(handleGear)),
                NavigationButtonConfig(image: UIImage(named: "bell"), selector: #selector(handleBell))
            ]
        )
        
    }
    
    // MARK: - OBJC
    @objc func handleFavorite(_ sender: UIButton) {
        animateButton(sender) {
            print("⭐ Favorite button tapped")
        }
    }
    
    @objc func handleGear(_ sender: UIButton) {
        animateButton(sender) {
            print("⚙️ Gear button tapped")
        }
    }
    
    @objc func handleBell(_ sender: UIButton) {
        animateButton(sender) {
            print("🔔 Bell button tapped")
        }
    }
    
}
