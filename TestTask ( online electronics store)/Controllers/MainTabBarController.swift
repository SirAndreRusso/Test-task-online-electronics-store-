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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tabBarItemsAppearence = UITabBarItemAppearance()
        tabBarItemsAppearence.normal.badgePositionAdjustment = UIOffset(horizontal: -15, vertical: -15)
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            UINavigationController(rootViewController: generateVC(viewController: MainViewController(), title: "Main", image: UIImage(named: "house"), selectedImage: UIImage(named: "house"))),
            UINavigationController(rootViewController: generateVC(viewController: BasketViewController(), title: "Cart", image: UIImage(named: "BigCart"), selectedImage: UIImage(named: "BigCart")))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = selectedImage
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 25, left: 0, bottom: -5, right: 0)
        viewController.tabBarItem.title = nil
        
        return viewController
    }
    
    private func setTabBarAppearance() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.backgroundColor = .clear

        setTabBarItemBadgeAppearance(appearence.stackedLayoutAppearance)
        setTabBarItemBadgeAppearance(appearence.inlineLayoutAppearance)
        setTabBarItemBadgeAppearance(appearence.compactInlineLayoutAppearance)
        
        setTabBarItemColors(appearence.stackedLayoutAppearance)
        setTabBarItemColors(appearence.inlineLayoutAppearance)
        setTabBarItemColors(appearence.compactInlineLayoutAppearance)
        
        tabBar.scrollEdgeAppearance = appearence
        tabBar.standardAppearance = appearence
        
        let positionOnX: CGFloat = 5
        let positionOnY: CGFloat = -(view.safeAreaInsets.bottom)
        let width = tabBar.bounds.width - positionOnX * 2
        let height = CGFloat(72)
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: positionOnY, width: width, height: height), cornerRadius: 30)
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width/2
        tabBar.itemPositioning = .fill
        roundLayer.fillColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        
        tabBar.layer.masksToBounds = true
        
        
        
    }
    
    private func setNavigationBarAppearence() {
        @available(iOS 15, *)
        let navigationBarAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    
    @available(iOS 13.0, *)
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .white
        itemAppearance.selected.iconColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
    }

    @available(iOS 13.0, *)
    private func setTabBarItemBadgeAppearance(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.badgeBackgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        itemAppearance.normal.badgeTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        itemAppearance.normal.badgePositionAdjustment = UIOffset(horizontal: 14, vertical: 14)
    }
}
