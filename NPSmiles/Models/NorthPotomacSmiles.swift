//
//  NorthPotomacSmiles.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import Foundation

struct NorthPotomacSmiles {
  
  static let legalName = "North Potomac Smiles, LLC."
  static let email = "info@northpotomacsmiles.com"
  static let telephoneText = "\nTelephone: "
  static let phoneNumber = "301.926.4408"
  static let faxText = "\n             Fax: "
  static let faxNumber = "301.926.4405"
  static let address = "15200 Shady Grove Rd, #408"
  static let cityState = "Rockville, MD"
  static let officeHours = "monday: 8:30am-5pm\ntuesday: 8:30am-5pm\nwednesday: 8:30am-5pm\nthursday: 8:30am-5pm\nfriday: 7:30am-3pm\nsat & sun: CLOSED"
  
  static let finalTextArray = ["\(NorthPotomacSmiles.legalName)\n",
                               NorthPotomacSmiles.email,
                               NorthPotomacSmiles.telephoneText,
                               NorthPotomacSmiles.phoneNumber,
                               NorthPotomacSmiles.faxText,
                               NorthPotomacSmiles.faxNumber]
}
