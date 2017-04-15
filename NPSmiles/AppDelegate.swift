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
  let tabBarController = UITabBarController()

  internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setupTabBarViewControllers()
    setRootViewController(to:tabBarController)
    return true
  }
  
  private func setupTabBarViewControllers() {
    let newsFeedVC = navControllerEmbeded(with:NewsFeedViewController())
    let contactVC = navControllerEmbeded(with:ContactViewController())
    tabBarController.viewControllers = [newsFeedVC,contactVC]
    setTabBarItemName(atIndex: 0, with: "Feed")
    setTabBarItemName(atIndex: 1, with: "Contact")
  }
  
  private func navControllerEmbeded(with vc:UIViewController) -> UINavigationController {
    let viewController = vc
    let embededVC = UINavigationController(rootViewController: viewController)
    return embededVC
  }
  
  private func setTabBarItemName(atIndex index:Int,with title:String) {
    if let item = tabBarController.tabBar.items {
      item[index].title = title
    }
  }
  
  private func setRootViewController(to tabBarController: UITabBarController) {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .white
    window?.rootViewController = tabBarController
  }
  
  


}

