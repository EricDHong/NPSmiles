//
//  ContactViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class ContactViewController: ContactView {
  
  var company = NorthPotomacSmiles()
  let finalAttributedText = NSMutableAttributedString()
  
  override func loadView() {
    super.loadView()
    setTextView()
  }
  
  func setTextView() {
    let nonlinkAttributes = makeAttribute(withSize: 24.0, ofColor: .black)
    let linkAttributes = makeAttribute(withSize: 24.0, ofColor: .blue)
    company.initFinalTextArray()
    for index in 0..<company.finalTextArray.count {
      attributeText(of: company.finalTextArray[index], with: (index % 2 == 0) ? linkAttributes : nonlinkAttributes)
    }
    contactInfoTextView.attributedText = finalAttributedText
  }
  
  func makeAttribute(withSize size:CGFloat,ofColor textColor:UIColor) -> [String:Any] {
    let fontAttribute = UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
    let customAttribute:[String:Any] = [ NSForegroundColorAttributeName : textColor,
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
