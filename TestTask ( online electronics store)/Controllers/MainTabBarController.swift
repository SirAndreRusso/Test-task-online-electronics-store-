//
//  MainTabBarController.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 06.09.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        generateTabBar()
        setTabBarAppearance()
    }
    private func generateTabBar() {
        viewControllers = [
            UINavigationController(rootViewController: generateVC(viewController: MainViewController(), title: "Main", image: UIImage(systemName: "house.fill"))),
            UINavigationController(rootViewController: generateVC(viewController: CartViewController(), title: "Cart", image: UIImage(systemName: "cart.fill")))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.shadowImage = UIImage()
        
        let positionOnX: CGFloat = 5
        let positionOnY: CGFloat = -(view.safeAreaInsets.bottom)
        let width = tabBar.bounds.width - positionOnX * 2
        let height = CGFloat(72)
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: positionOnY, width: width, height: height), cornerRadius: 30)
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width/5
        tabBar.itemPositioning = .fill
        roundLayer.fillColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        tabBar.layer.backgroundColor = nil
        
    }
}
