//
//  AppDelegate.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let loginViewController = LoginViewController()

  internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    GMSServices.provideAPIKey("AIzaSyDu7AFyu0ksAf57OLoLMQoHytG3t5LFFkc")
    setRootViewController(to: loginViewController)
    return true
  }
  
  fileprivate func setRootViewController(to controller: UIViewController) {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .white
    window?.rootViewController = controller
  }


}

