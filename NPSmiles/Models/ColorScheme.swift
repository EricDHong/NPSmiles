//
//  ColorScheme.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/17/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

struct ColorScheme {
  static let primary = UIColor(red: 6/255, green: 101/255, blue: 155/255, alpha: 1.0)
  static let secondary = UIColor(red: 142/255, green: 205/255, blue: 242/255, alpha: 1.0)
  static let darkGrey = UIColor(red: 40/255, green: 60/255, blue: 71/255, alpha: 1.0)
  static let lightGrey = UIColor(red: 248/255, green: 249/255, blue: 250/255, alpha: 1.0)
}

struct ScreenSize {
  static let height = UIScreen.main.bounds.height
  static let width = UIScreen.main.bounds.width
}
