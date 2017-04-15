//
//  NorthPotomacSmiles.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import Foundation

struct NorthPotomacSmiles {
  var finalTextArray = [String]()
  
  let legalName = "North Potomac Smiles, LLC."
  let email = "info@northpotomacsmiles.com"
  let telephoneText = "\nTelephone: "
  let phoneNumber = "301.926.4408"
  let faxText = "\n             Fax: "
  let faxNumber = "301.926.4405"
  let address = "15200 Shady Grove Rd, #408"
  let cityState = "Rockville, MD 20850"
  
  mutating func initFinalTextArray() {
    finalTextArray = [email, telephoneText, phoneNumber, faxText, faxNumber]
  }
}
