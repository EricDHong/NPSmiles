//
//  ContactViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class ContactViewController: ContactView {
  
  let finalAttributedText = NSMutableAttributedString()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    legalNameLabel.text = NorthPotomacSmiles.legalName
    setTextOfContactTextView()
    addressButton.setTitle("\(NorthPotomacSmiles.address) Rockville, MD", for: .normal)
    daysOfTheWeekTextView.text = NorthPotomacSmiles.daysOfWeek
    officeHoursTimeTextView.text = NorthPotomacSmiles.officeHourTime
  }
  
  func setTextOfContactTextView() {
    let nonlinkAttributes = makeAttribute(withSize: 20.0, ofColor: .black)
    let linkAttributes = makeAttribute(withSize: 20.0, ofColor: .blue)
    for index in 0..<NorthPotomacSmiles.finalTextArray.count {
      attributeText(of: NorthPotomacSmiles.finalTextArray[index], with: (index % 2 == 0) ? linkAttributes : nonlinkAttributes)
    }
    contactInfoTextView.attributedText = finalAttributedText
  }
  
  func makeAttribute(withSize size:CGFloat,ofColor textColor:UIColor) -> [String:Any] {
    let fontAttribute = UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
    let style = NSMutableParagraphStyle()
    style.alignment = .right
    let customAttribute = [ NSForegroundColorAttributeName : textColor,
                                       NSFontAttributeName : fontAttribute,
                                       NSParagraphStyleAttributeName : style]
    return customAttribute
  }
  
  func attributeText(of text:String,with attributes:[String:Any]) {
    let text = text
    let attrText = NSMutableAttributedString(string: text)
    attrText.addAttributes(attributes, range: NSRange(0..<text.characters.count))
    finalAttributedText.append(attrText)
  }
  
  func openAddress() {
    UIApplication.shared.open(URL(string:"https://www.google.com/maps/@42.585444,13.007813,6z")!)
  }

}
