//
//  AppDelegate.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 22.08.2022.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 15, *) {
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithTransparentBackground()
                        navigationBarAppearance.titleTextAttributes = [
                            NSAttributedString.Key.foregroundColor : UIColor.white
                        ]
                        navigationBarAppearance.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
                        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
                    
//                    let tabBarApperance = UITabBarAppearance()
//                    tabBarApperance.configureWithOpaqueBackground()
//                    tabBarApperance.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//                    UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
//                    UITabBar.appearance().standardAppearance = tabBarApperance
                }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

