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
    label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightLight)
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
  
  private let googleMapView:GMSMapView = {
    let camera = GMSCameraPosition.camera(withLatitude: 39.104729, longitude: -77.191294, zoom: 16.0)
    let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    mapView.padding = UIEdgeInsetsMake(90, 0, 0, 0)
    return mapView
  }()
  
  internal let addressButton:UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.blue, for: .normal)
    button.addTarget(self, action: #selector(ContactViewController.openAddress), for: .touchUpInside)
    return button
  }()
  
  private let officeHourLabel:UILabel = {
    let label = UILabel()
    label.text = "OFFICE HOURS"
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightLight)
    return label
  }()
  
  private let containerForTextViews:UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  internal var daysOfTheWeekTextView:UITextView = {
    let textView = UITextView()
    textView.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightLight)
    textView.textAlignment = .right
    textView.textColor = .black
    return textView
  }()
  
  internal var officeHoursTimeTextView:UITextView = {
    let textView = UITextView()
    textView.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightLight)
    textView.textAlignment = .left
    textView.textColor = .black
    return textView
  }()
  
  override func loadView() {
    super.loadView()
    addSubviews()
    setupConstraints()
    addMarker(to: googleMapView)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Contact Info"
  }
  
  private func addSubviews() {
    let views = [legalNameLabel,
                 contactInfoTextView,
                 googleMapView,
                 addressButton,
                 officeHourLabel,
                 containerForTextViews]
    for viewObject in views {
      view.addSubview(viewObject)
    }
    containerForTextViews.addSubview(daysOfTheWeekTextView)
    containerForTextViews.addSubview(officeHoursTimeTextView)
  }
  
  private func disableAutoresizingMaskIntoConstraints() {
    legalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    contactInfoTextView.translatesAutoresizingMaskIntoConstraints = false
    googleMapView.translatesAutoresizingMaskIntoConstraints = false
    addressButton.translatesAutoresizingMaskIntoConstraints = false
    officeHourLabel.translatesAutoresizingMaskIntoConstraints = false
    containerForTextViews.translatesAutoresizingMaskIntoConstraints = false
    daysOfTheWeekTextView.translatesAutoresizingMaskIntoConstraints = false
    officeHoursTimeTextView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    disableAutoresizingMaskIntoConstraints()
    viewsDictionary = ["v0":legalNameLabel,
                       "v1":contactInfoTextView,
                       "v2":googleMapView,
                       "v3":addressButton,
                       "v4":officeHourLabel,
                       "v5":containerForTextViews,
                       "v6":daysOfTheWeekTextView,
                       "v7":officeHoursTimeTextView] as [String:Any]
    
    let navBarHeight = self.navigationController?.navigationBar.frame.size.height
    let navHeightPadding = navBarHeight! + 20
    let navPadding = String(describing: navHeightPadding)
    
    let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
    let tabHeightPadding = tabBarHeight!
    let tabPadding = String(describing: tabHeightPadding)
    
    configureConstraint(with: "H:|-8-[v0]-8-|", to: view, of:viewsDictionary!)
    configureConstraint(with: "H:|-8-[v1]-8-|", to: view, of:viewsDictionary!)
    configureConstraint(with: "H:|-8-[v2]-8-|", to: view, of:viewsDictionary!)
    configureConstraint(with: "H:|-8-[v3]-8-|", to: view, of:viewsDictionary!)
    configureConstraint(with: "H:|-8-[v4]-8-|", to: view, of:viewsDictionary!)
    configureConstraint(with: "H:|[v5]|", to: view, of: viewsDictionary!)
    configureConstraint(with: "V:|-\(navPadding)-[v0(40)][v1(100)][v2(150)][v3(40)][v4(40)][v5]-\(tabPadding)-|",
                          to: self.view,
                          of:viewsDictionary!)
    configureConstraint(with: "H:|-8-[v6(175)]-2-[v7]-8-|", to: containerForTextViews, of:viewsDictionary!)
    configureConstraint(with: "V:|[v6]|", to: containerForTextViews, of:viewsDictionary!)
    configureConstraint(with: "V:|[v7]|", to: containerForTextViews, of:viewsDictionary!)

  }
  
  private func addMarker(to mapView: GMSMapView) {
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: 39.104729, longitude: -77.191294)
    marker.title = "Located on 4th Floor #408"
    marker.snippet = "North Potomac Smiles"
    marker.map = mapView
    mapView.selectedMarker = marker
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
}
