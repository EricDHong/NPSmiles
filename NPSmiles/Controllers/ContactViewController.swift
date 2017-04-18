//
//  ContactViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit
import GoogleMaps

class ContactViewController: ContactView {
  
  let finalAttributedText = NSMutableAttributedString()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    officeHoursTextView.text = "OFFICE HOURS:\n\(NorthPotomacSmiles.officeHours)"
    addressButton.setTitle("\(NorthPotomacSmiles.address)", for: .normal)
    setTextOfContactTextView()
    addMarker(to: googleMapView)
  }
  
  func setTextOfContactTextView() {
    let nonlinkAttributes = makeAttribute(withSize: 22.0, ofColor: .black)
    let linkAttributes = makeAttribute(withSize: 21.5, ofColor: .blue)
    for index in 0..<NorthPotomacSmiles.finalTextArray.count {
      attributeText(of: NorthPotomacSmiles.finalTextArray[index], with: (index % 2 == 0) ? nonlinkAttributes : linkAttributes)
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
    UIApplication.shared.open(URL(string:"https://www.google.com/maps/place/North+Potomac+Smiles/@39.1046951,-77.1934817,17z/data=!3m1!4b1!4m5!3m4!1s0x89b7cd544377fb59:0x72b1526f4e688fa3!8m2!3d39.104691!4d-77.191293")!)
  }
  
  private func addMarker(to mapView: GMSMapView) {
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: 39.104729, longitude: -77.191294)
    marker.title = "\(NorthPotomacSmiles.legalName)"
    marker.snippet = NorthPotomacSmiles.cityState
    marker.map = mapView
    mapView.selectedMarker = marker
  }

}
