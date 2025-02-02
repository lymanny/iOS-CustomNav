//
//  MainTabVC.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit

class MainTabVC: UIViewController {
    
    // MARK: - Properties & Variable
    private var currentVC: UIViewController?
    private var viewControllerCache: [Int: UIViewController] = [:]
    
    private var buttons: [UIButton] = []
    
    private let tabTitles        = ["Overview", "Cart", "Favorite", "Notify"]
    private let tabIcons         = ["house", "cart", "heart", "bell"]
    private let tabIconsSelected = ["house.fill", "cart.fill", "heart.fill", "bell.fill"]
    
    private lazy var tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: -3)
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
        switchToTab(index: 0) // Default: Overview tab
    }
    
    // MARK: - Function
    private func setupTabBar() {
        view.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarView.heightAnchor.constraint(equalToConstant: 70),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        tabBarView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: tabBarView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor)
        ])
        
        for (index, title) in tabTitles.enumerated() {
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: tabIcons[index])
            config.imagePlacement = .top
            config.imagePadding = 5
            config.baseForegroundColor = .darkGray
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 14, weight: .medium)]))
            
            let button = UIButton(configuration: config)
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    private func switchToTab(index: Int) {
        if let currentVC = currentVC {
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }
        
        if viewControllerCache[index] == nil {
            let vc = createViewController(for: index)
            let navVC = UINavigationController(rootViewController: vc)
            viewControllerCache[index] = navVC
        }
        
        guard let newVC = viewControllerCache[index] else { return }
        
        addChild(newVC)
        view.insertSubview(newVC.view, belowSubview: tabBarView)
        newVC.view.frame = view.bounds
        newVC.didMove(toParent: self)
        
        currentVC = newVC
        
        for (i, button) in buttons.enumerated() {
            if i == index {
                var selectedConfig = button.configuration
                selectedConfig?.image = UIImage(systemName: tabIconsSelected[i])
                selectedConfig?.baseForegroundColor = .black
                button.configuration = selectedConfig
            } else {
                var defaultConfig = button.configuration
                defaultConfig?.image = UIImage(systemName: tabIcons[i])
                defaultConfig?.baseForegroundColor = .darkGray
                button.configuration = defaultConfig
            }
        }
    }
    
    private func createViewController(for index: Int) -> UIViewController {
        switch index {
        case 1: return CartVC()
        case 2: return FavoriteVC()
        case 3: return NotificationVC()
        default: return OverviewVC()
        }
    }
    
    // MARK: - OBJC
    @objc private func tabButtonTapped(_ sender: UIButton) {
        switchToTab(index: sender.tag)
    }
    
}
