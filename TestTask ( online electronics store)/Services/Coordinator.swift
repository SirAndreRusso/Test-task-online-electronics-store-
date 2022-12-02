//
//  Coordinator.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 27.11.2022.
//

import Foundation
import UIKit

enum Event {
    case goToProductDetailsVC
    case goToFilterVC
    case closeFilterVC
    case goToBasketVC
}

class Coordinator: CoordinatorProtocol {
    
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        guard let mainTabBarController = tabBarController as? MainTabBarController
        else {return}
        guard let naVC = mainTabBarController.viewControllers?[0] as? UINavigationController
        else {return}
        var mainVC: UIViewController & CoordinatingProtocol = naVC.viewControllers[0] as! MainViewController
        mainVC.coordinator = self
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .goToProductDetailsVC:
            guard let mainTabBarController = tabBarController as? MainTabBarController
            else {return}
            guard let naVC = mainTabBarController.viewControllers?[0] as? UINavigationController
            else {return}
            guard let mainVC = naVC.viewControllers[0] as? MainViewController & CoordinatingProtocol
            else {return}
            let productDetailsVC = ProductDetailsViewController()
            productDetailsVC.coordinator = self
            // Костыльное решение, так как API не предоставляет цену со скидкой для экрана Product details
            for bestseller in mainVC.bestSeller {
                if bestseller.title == "Samsung Galaxy s20 Ultra" {
                    productDetailsVC.discountPrice = bestseller.priceWithoutDiscount
                }
            }
            naVC.pushViewController(productDetailsVC, animated: true)
            
        case .goToFilterVC:
            guard let mainTabBarController = tabBarController as? MainTabBarController
            else {return}
            guard let naVC = mainTabBarController.viewControllers?[0] as? UINavigationController
            else {return}
            guard let mainVC = naVC.viewControllers[0] as? MainViewController & CoordinatingProtocol
            else {return}
            let filterVC = FilterViewController()
            filterVC.coordinator = self
            filterVC.modalPresentationStyle = .overCurrentContext
            mainVC.present(filterVC, animated: false)
            mainTabBarController.tabBar.isHidden = true
            
        case .closeFilterVC:
            guard let mainTabBarController = tabBarController as? MainTabBarController
            else {return}
            mainTabBarController.tabBar.isHidden = false
            
        case .goToBasketVC:
            guard let mainTabBarController = tabBarController as? MainTabBarController
            else {return}
            guard let naVC = mainTabBarController.viewControllers?[1] as? UINavigationController
            else {return}
            guard var vC = naVC.viewControllers[0] as? UIViewController & CoordinatingProtocol
            else {return}
            vC.coordinator = self
            mainTabBarController.selectedViewController = naVC
       
        }
    }
}
    
