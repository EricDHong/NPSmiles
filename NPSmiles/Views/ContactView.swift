//
//  ContactView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit
import GoogleMaps

class ContactView: UIViewController {
  
  private var viewsDictionary:[String:Any]?
  
  internal let legalNameLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 28.0, weight: UIFontWeightLight)
    label.textAlignment = .center
    return label
  }()
  
  internal let contactInfoTextView: UITextView = {
    let textView = UITextView()
    textView.textAlignment = .center
    textView.dataDetectorTypes = .all
    textView.isEditable = false
    textView.isSelectable = true
    return textView
  }()
  
  internal let googleMapView:GMSMapView = {
    let camera = GMSCameraPosition.camera(withLatitude: 39.104729, longitude: -77.191294, zoom: 16.0)
    let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: 39.104729, longitude: -77.191294)
    marker.title = "Located on 4th Floor #408"
    marker.snippet = "North Potomac Smiles"
    marker.map = mapView
    mapView.selectedMarker = marker
    return mapView
  }()
  
  override func loadView() {
    super.loadView()
    addSubviews()
    setupConstraints()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Contact"
  }
  
  private func addSubviews() {
    let views = [legalNameLabel, contactInfoTextView, googleMapView]
    for view in views {
      self.view.addSubview(view)
    }
  }
  
  private func disableAutoresizingMaskIntoConstraints() {
    legalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    contactInfoTextView.translatesAutoresizingMaskIntoConstraints = false
    googleMapView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    viewsDictionary = ["v0":legalNameLabel, "v1":contactInfoTextView, "v2":googleMapView] as [String:Any]
    disableAutoresizingMaskIntoConstraints()
    
    let navBarHeight = self.navigationController?.navigationBar.frame.size.height
    let height = navBarHeight! + 20
    let padding = String(describing: height)
    
    configureConstraint(with: "H:|-8-[v0]-8-|", to: self.view, of: viewsDictionary!)
    configureConstraint(with: "H:|-8-[v1]-8-|", to: self.view, of: viewsDictionary!)
    configureConstraint(with: "H:|-8-[v2]-8-|", to: self.view, of: viewsDictionary!)
    configureConstraint(with: "V:|-\(padding)-[v0(50)][v1(100)][v2(200)]",
                          to: self.view,
                          of: viewsDictionary!)
  }
}









extension UIViewController {
  func configureConstraint(with visualFormat:String, to view:UIView, of dictionaryViews:[String:Any]) {
    let constraint = NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                             options: NSLayoutFormatOptions(),
                                                             metrics: nil,
                                                               views: dictionaryViews)
    view.addConstraints(constraint)
  }
  
  func makeText(_ text:String, color:UIColor,size fontSize:CGFloat,weight:CGFloat) -> NSMutableAttributedString {
    let textsnippet = text
    let textColor = color
    let font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    let attributes = [NSForegroundColorAttributeName : textColor,
                                 NSFontAttributeName : font
    ]
    let attributedText = NSMutableAttributedString(string: textsnippet, attributes: attributes)
    return attributedText
  }
}
