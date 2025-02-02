//
//  CartViewVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit

class CartViewVC: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }
    
    // MARK: - Function
    func setupNav() {
        setNavigationBarStyle(
            isHidden: false,
            barTintColor: UIColor.cyan,
            titleConfig: NavigationTitleConfig(title: "Cart View"),
            subtitleConfig: NavigationSubtitleConfig(
                subtitle: "Items",
                subtitleFontSize: 13,
                subtitleColor: .systemBlue
            ),
            leftButtons: [
                NavigationButtonConfig(image: UIImage(named: "back"), selector: #selector(handleBack))
            ],
            rightButtons: [
                NavigationButtonConfig(image: UIImage(named: "plus"), selector: #selector(handleAddItem)),
                NavigationButtonConfig(titleConfig: ButtonTitleConfig(title: "Checkout"), selector: #selector(handleCheckout))
            ],
            titleSubtitleSpacing: 0,
            btnLeftRightSpacing: 10
        )
    }
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - OBJC
    @objc func handleAddItem(_ sender: UIButton) {
        animateButton(sender) {
            print("➕ Add Item tapped")
        }
        
    }
    
    @objc func handleCheckout(_ sender: UIButton) {
        animateButton(sender) {
            print("🛒 Checkout tapped")
        }
        
    }
    
}
