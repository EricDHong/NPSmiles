//
//  AppDelegate.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .white
    
    let newsfeedVC = NewsFeedViewController()
    let navNewsFeedVC = UINavigationController(rootViewController: newsfeedVC)
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [navNewsFeedVC]
    tabBarController.tabBarItem.title = "Feed"
    window?.rootViewController = tabBarController
    return true
  }


}

