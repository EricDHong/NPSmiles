//
//  ContactViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class ContactViewController: ContactView {
  
  var npsCompany = NorthPotomacSmiles()
  let finalAttributedText = NSMutableAttributedString()
  
  override func loadView() {
    super.loadView()
    legalNameLabel.text = npsCompany.legalName
    setTextOfContactTextView()
  }
  
  func setTextOfContactTextView() {
    let nonlinkAttributes = makeAttribute(withSize: 24.0, ofColor: .black)
    let linkAttributes = makeAttribute(withSize: 24.0, ofColor: .blue)
    npsCompany.initFinalTextArray()
    for index in 0..<npsCompany.finalTextArray.count {
      attributeText(of: npsCompany.finalTextArray[index], with: (index % 2 == 0) ? linkAttributes : nonlinkAttributes)
    }
    contactInfoTextView.attributedText = finalAttributedText
  }
  
  func makeAttribute(withSize size:CGFloat,ofColor textColor:UIColor) -> [String:Any] {
    let fontAttribute = UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
    let customAttribute = [ NSForegroundColorAttributeName : textColor,
                                       NSFontAttributeName : fontAttribute]
    return customAttribute
  }
  
  func attributeText(of text:String,with attributes:[String:Any]) {
    let text = text
    let attrText = NSMutableAttributedString(string: text)
    attrText.addAttributes(attributes, range: NSRange(0..<text.characters.count))
    finalAttributedText.append(attrText)
  }

}
