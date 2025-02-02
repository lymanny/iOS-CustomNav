//
//  CartVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit

class CartVC: UIViewController {
    
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
            titleConfig: NavigationTitleConfig(
                title: "Cart",
                titleImage: UIImage(named: "down-arrow"),
                titleSelector: #selector(showPopup)
            ),
            leftButtons: [
                NavigationButtonConfig(image: UIImage(named: "profile"), selector: #selector(handleProfile))
            ],
            rightButtons: [
                NavigationButtonConfig(image: UIImage(named: "favorite"), selector: #selector(handleFavorite)),
                NavigationButtonConfig(image: UIImage(named: "cart"), selector: #selector(handleAddToCart))
            ]
        )
    }
    
    func navigateToCartView() {
        let cartViewVC = CartViewVC()
        navigationController?.pushViewController(cartViewVC, animated: true)
    }
    
    // MARK: - OBJC
    @objc func showPopup(_ sender: UIButton) {
        animateButton(sender) {
            let alert = UIAlertController(title: "Cart Options", message: "Choose an action", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "View Cart", style: .default, handler: { _ in
                self.navigateToCartView()
            }))
            alert.addAction(UIAlertAction(title: "Clear Cart", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @objc func handleFavorite(_ sender: UIButton) {
        animateButton(sender) {
            print("⭐ Favorite button tapped")
        }
    }
    
    @objc func handleAddToCart(_ sender: UIButton) {
        animateButton(sender) {
            print("🛒 Added to cart tapped")
        }
    }
}
