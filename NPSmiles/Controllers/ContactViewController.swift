//
//  ContactViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class ContactViewController: ContactView {
  
  let company = NorthPotomacSmiles()
  let finalAttributedText = NSMutableAttributedString()
  var finalTextArray = [String]()
  
  override func loadView() {
    super.loadView()
    setTextView()
  }
  
  func setTextView() {
    let fontAttribute = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightLight)
    let nonlinkAttributes:[String:Any] = [ NSForegroundColorAttributeName : UIColor.black,
                                           NSFontAttributeName : fontAttribute]
    let linkAttributes:[String:Any] = [ NSForegroundColorAttributeName : UIColor.blue,
                                        NSFontAttributeName : fontAttribute]
    
    let emailText = "\(company.email)\n"
    let phoneText1 = "Telephone: "
    let phoneText2 = "\(company.phoneNumber)\n"
    let faxText1 = "Fax: "
    let faxText2 = "\(company.phoneNumber)\n"
    
    finalTextArray = [emailText, phoneText1, phoneText2, faxText1, faxText2]
    for index in 0..<finalTextArray.count {
      attributeText(of: finalTextArray[index], with: (index % 2 == 0) ? linkAttributes : nonlinkAttributes)
    }
    contactInfoTextView.attributedText = finalAttributedText
  }
  
  func attributeText(of text:String,with attributes:[String:Any]) {
    let text = text
    let attrText = NSMutableAttributedString(string: text)
    attrText.addAttributes(attributes, range: NSRange(0..<text.characters.count))
    finalAttributedText.append(attrText)
  }

}
