//
//  LoginViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/20/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class LoginViewController: LoginView {
  
  var tabController = UITabBarController()
  
  fileprivate func setupTabBarViewControllers() {
    let newsFeedVC = navControllerEmbeded(with:NewsFeedViewController())
    let contactVC = navControllerEmbeded(with:ContactViewController())
    tabController.viewControllers = [newsFeedVC,contactVC]
    setTabBarItemName(atIndex: 0, with: "News")
    setTabBarItemName(atIndex: 1, with: "Contact")
  }
  
  fileprivate func navControllerEmbeded(with vc:UIViewController) -> UINavigationController {
    let viewController = vc
    let embededVC = UINavigationController(rootViewController: viewController)
    return embededVC
  }
  
  fileprivate func setTabBarItemName(atIndex index:Int,with title:String) {
    if let item = tabController.tabBar.items {
      item[index].title = title
    }
  }
  
  func doASegue(to viewController: UIViewController) {
    
  }

}
