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
    setViewsText()
    setMapMarker()
  }
  
  fileprivate func setViewsText() {
    officeHoursTextView.text = "OFFICE HOURS:\n\(NorthPotomacSmiles.officeHours)"
    addressButton.setTitle("\(NorthPotomacSmiles.address)", for: .normal)
    attributeContactInfoText()
  }
  
  fileprivate func attributeContactInfoText() {
    for index in 0..<NorthPotomacSmiles.contactInfoText.count {
      let attributes = (index % 2 == 0) ? nonlinkAttributes : linkAttributes
      appendAttributeText(of: NorthPotomacSmiles.contactInfoText[index],
                        with: attributes,
                          to: attributedContactInfoText) }
    contactInfoTextView.attributedText = attributedContactInfoText
  }
  
  func openAddress() { UIApplication.shared.open(URL(string:"https://goo.gl/maps/zZD917111AJ2")!) }
  
  fileprivate func setMapMarker() {
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: NorthPotomacSmiles.latitude,
                                             longitude: NorthPotomacSmiles.longitude)
    marker.title = "\(NorthPotomacSmiles.legalName)"
    marker.snippet = NorthPotomacSmiles.cityState
    marker.map = googleMapView
    googleMapView.selectedMarker = marker
  }

}
