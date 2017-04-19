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
  
  let attributedContactInfoText = NSMutableAttributedString()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewsText()
    setupMapMarker()
  }
  
  private func setupViewsText() {
    officeHoursTextView.text = "OFFICE HOURS:\n\(NorthPotomacSmiles.officeHours)"
    addressButton.setTitle("\(NorthPotomacSmiles.address)", for: .normal)
    attributeContactInfoText()
  }
  
  private func attributeContactInfoText() {
    let nonlinkAttributes = makeAttribute(withSize: 22.0, ofColor: .black)
    let linkAttributes = makeAttribute(withSize: 21.5, ofColor: ColorScheme.primaryColor)
    for index in 0..<NorthPotomacSmiles.contactInfoText.count {
      let attributes = (index % 2 == 0) ? nonlinkAttributes : linkAttributes
      appendAttributeText(of: NorthPotomacSmiles.contactInfoText[index],
                          with: attributes,
                          to: attributedContactInfoText)
    }
    contactInfoTextView.attributedText = attributedContactInfoText
  }
  
  private func makeAttribute(withSize size:CGFloat,ofColor textColor:UIColor) -> [String:Any] {
    let fontAttribute = UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
    let style = NSMutableParagraphStyle()
    style.alignment = .right
    let customAttribute = [ NSForegroundColorAttributeName : textColor,
                                       NSFontAttributeName : fontAttribute,
                                       NSParagraphStyleAttributeName : style]
    return customAttribute
  }
  
  func openAddress() { UIApplication.shared.open(URL(string:"https://goo.gl/maps/zZD917111AJ2")!) }
  
  private func setupMapMarker() {
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: NorthPotomacSmiles.latitude,
                                             longitude: NorthPotomacSmiles.longitude)
    marker.title = "\(NorthPotomacSmiles.legalName)"
    marker.snippet = NorthPotomacSmiles.cityState
    marker.map = googleMapView
    googleMapView.selectedMarker = marker
  }

}
