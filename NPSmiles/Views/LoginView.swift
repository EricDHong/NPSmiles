//
//  LoginView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/20/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome!"
    label.font = UIFont.systemFont(ofSize: 32.0, weight: UIFontWeightUltraLight)
    label.textColor = ColorScheme.darkGrey
    return label
  }()
  
  let guestLoginButton: UIButton = {
    let button = UIButton()
    button.titleLabel?.text = "Continue"
    button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightThin)
    button.titleLabel?.textColor = ColorScheme.primary
    button.addTarget(self, action: #selector(doASegue), for: .touchUpInside)
    return button
  }()
  
  let adminLoginButton: UIButton = {
    let button = UIButton()
    button.titleLabel?.text = "I am Dr.Kodsi"
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)
    button.titleLabel?.textColor = ColorScheme.secondary
    button.addTarget(self, action: #selector(doASegue), for: .touchUpInside)
    return button
  }()
  
  func setupViews() {
    view.addSubview(titleLabel)
    view.addSubview(guestLoginButton)
    view.addSubview(adminLoginButton)
  }
  
  // MARK: Segue
  func doASegue(to viewController: UIViewController) {
    
  }

}
