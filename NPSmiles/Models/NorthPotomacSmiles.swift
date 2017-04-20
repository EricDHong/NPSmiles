//
//  NorthPotomacSmiles.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import Foundation
import UIKit

struct NorthPotomacSmiles {
  
  static let legalName = "North Potomac Smiles, LLC."
  static let email = "info@northpotomacsmiles.com"
  static let phoneNumber = "301.926.4408"
  static let faxNumber = "301.926.4405"
  static let address = "15200 Shady Grove Rd, #408"
  static let cityState = "Rockville, MD"
  static let officeHours = "monday: 8:30am-5pm\ntuesday: 8:30am-5pm\nwednesday: 8:30am-5pm\nthursday: 8:30am-5pm\nfriday: 7:30am-3pm\nsat & sun: CLOSED"
  static let latitude = 39.104729
  static let longitude = -77.191294
  
  static let feedImage = "feedImage"
  
  static let contactInfoText = ["\(NorthPotomacSmiles.legalName)\n",
                               NorthPotomacSmiles.email,
                               "\nTelephone: ",
                               NorthPotomacSmiles.phoneNumber,
                               "\n             Fax: ",
                               NorthPotomacSmiles.faxNumber]
  
  static func openAddressUrl() {
    UIApplication.shared.open(URL(string:"https://goo.gl/maps/zZD917111AJ2")!)
  }
}
