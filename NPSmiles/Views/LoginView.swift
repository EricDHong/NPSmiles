//
//  LoginView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/20/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
  
  internal let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome!"
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 32.0, weight: UIFontWeightUltraLight)
    label.textColor = ColorScheme.darkGrey
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()
  
  internal let guestLoginButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Continue", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightThin)
    button.setTitleColor(ColorScheme.primary, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.titleLabel?.minimumScaleFactor = 0.5
    button.titleLabel?.textAlignment = .center
    button.addTarget(self, action: #selector(LoginViewController.doASegue), for: .touchUpInside)
    return button
  }()
  
  internal let adminLoginButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("I am Dr. Kodsi", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)
    button.setTitleColor(ColorScheme.secondary, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.titleLabel?.minimumScaleFactor = 0.5
    button.titleLabel?.textAlignment = .center
    button.addTarget(self, action: #selector(LoginViewController.doASegue), for: .touchUpInside)
    return button
  }()
  
  override func loadView() {
    super.loadView()
    setupViews()
  }
  
  fileprivate func setupViews() {
    view.addSubview(welcomeLabel)
    view.addSubview(guestLoginButton)
    view.addSubview(adminLoginButton)
    setupConstraints()
  }
  
  fileprivate func disableAutoresizingMaskIntoConstraints() {
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    guestLoginButton.translatesAutoresizingMaskIntoConstraints = false
    adminLoginButton.translatesAutoresizingMaskIntoConstraints = false
  }
  
  fileprivate func setupConstraints() {
    disableAutoresizingMaskIntoConstraints()
    let viewsDictionary = ["v0" : welcomeLabel, "v1" : guestLoginButton, "v2" : adminLoginButton]
    
    configureConstraint(with: "H:|-8-[v0]-8-|", to: view, of: ["v0" : welcomeLabel])
    configureConstraint(with: "H:|-8-[v1]-8-|", to: view, of: ["v1" : guestLoginButton])
    configureConstraint(with: "H:|-8-[v2]-8-|", to: view, of: ["v2" : adminLoginButton])
    configureConstraint(with: "V:|[v0(100)]-8-[v1(100)]-20-[v2(50)]-4-|", to: view, of: viewsDictionary)
  }

}
