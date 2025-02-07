//
//  FavoriteVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit
import NavLib

class FavoriteVC: UIViewController {
    
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
                title: "Favorite",
                titleImage: UIImage(named: "down-arrow"),
                titleImageDirection: .leading,
                titleSelector: #selector(showFavoriteListPopup)
            ),
            leftButtons: [
                NavigationButtonConfig(image: UIImage(named: "profile"), selector: #selector(handleProfile))
            ]
        )
    }
    
    // MARK: - OBJC
    @objc func showFavoriteListPopup(_ sender: UIButton) {
        animateButton(sender) {
            let alertController = UIAlertController(
                title: "Choose Favorite ⭐",
                message: "Select your favorite option:",
                preferredStyle: .actionSheet // Use .alert for a classic popup
            )
            
            // Favorite options
            let favoriteMovie = UIAlertAction(title: "🎬 Movie", style: .default) { _ in
                print("🎬 Movie added to favorites")
            }
            let favoriteMusic = UIAlertAction(title: "🎵 Music", style: .default) { _ in
                print("🎶 Music added to favorites")
            }
            
            // Cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                print("❌ Favorite selection canceled")
            }
            
            // Add actions to alert
            alertController.addAction(favoriteMovie)
            alertController.addAction(favoriteMusic)
            alertController.addAction(cancelAction)
            
            // Handle iPad compatibility for action sheets
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
            
            // Present the alert
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}
