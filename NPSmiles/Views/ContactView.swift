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
  
  //MARK: Views
  private var scrollView = UIScrollView()
  private var contentView = UIView()
  
  internal let contactInfoTextView: UITextView = {
    let textView = UITextView()
    textView.textAlignment = .center
    textView.dataDetectorTypes = .all
    textView.isEditable = false
    textView.isSelectable = true
    textView.isScrollEnabled = false
    return textView
  }()
  
  internal let googleMapView:GMSMapView = {
    let camera = GMSCameraPosition.camera(withLatitude: 39.104729, longitude: -77.191294, zoom: 16.0)
    let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    mapView.padding = UIEdgeInsetsMake(90, 0, 0, 0)
    return mapView
  }()
  
  internal let addressButton:UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(ColorScheme.primaryColor, for: .normal)
    button.addTarget(self, action: #selector(ContactViewController.openAddress), for: .touchUpInside)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightLight)
    return button
  }()
  
  internal var officeHoursTextView:UITextView = {
    let textView = UITextView()
    textView.font = UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightLight)
    textView.textAlignment = .right
    textView.textColor = .black
    textView.isEditable = false
    textView.isSelectable = false
    textView.isScrollEnabled = false
    return textView
  }()
  
  override func loadView() {
    super.loadView()
    setupNavigationBar()
    setupScrollView(with: contentView)
    addSubviewsToContentView()
    setupConstraints()
  }
  
  //MARK: Setup views
  private func setupNavigationBar() {
    self.navigationItem.title = "Contact Info"
    let font = UIFont.systemFont(ofSize: 25.0, weight: UIFontWeightThin)
    let attributes = [NSFontAttributeName : font,
                      NSForegroundColorAttributeName : ColorScheme.primaryColor]
    self.navigationController?.navigationBar.titleTextAttributes = attributes
  }
  
  private func setupScrollView(with containerView:UIView) {
    let iphone5Height: CGFloat = 568
    let contentSizeHeight = ScreenSize.height == iphone5Height ? ScreenSize.height+60 : ScreenSize.height
    scrollView.contentSize = CGSize(width: ScreenSize.width, height: contentSizeHeight)
    scrollView.showsVerticalScrollIndicator = false
    view.addSubview(scrollView)
    containerView.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height+100)
    scrollView.addSubview(containerView)
  }
  
  private func addSubviewsToContentView() {
    let views = [contactInfoTextView, googleMapView, addressButton, officeHoursTextView]
    for viewObject in views { contentView.addSubview(viewObject) }
  }
  
  //MARK: Constraints
  private func disableAutoresizingMaskIntoConstraints() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contactInfoTextView.translatesAutoresizingMaskIntoConstraints = false
    googleMapView.translatesAutoresizingMaskIntoConstraints = false
    addressButton.translatesAutoresizingMaskIntoConstraints = false
    officeHoursTextView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    disableAutoresizingMaskIntoConstraints()
    
    configureConstraint(with: "H:|[v0]|", to: view, of: ["v0" : scrollView])
    configureConstraint(with: "V:|[v0]|", to: view, of: ["v0" : scrollView])
    configureConstraint(with: "H:|-8-[v1]-8-|", to: contentView, of:["v1" : contactInfoTextView])
    configureConstraint(with: "H:|-8-[v2]-8-|", to: contentView, of:["v2" : googleMapView])
    configureConstraint(with: "H:|-8-[v3]-8-|", to: contentView, of:["v3" : addressButton])
    configureConstraint(with: "H:|-8-[v4]-8-|", to: contentView, of:["v4" : officeHoursTextView])
    
    let viewsDictionary = ["v0":scrollView,
                           "v1":contactInfoTextView,
                           "v2":googleMapView,
                           "v3":addressButton,
                           "v4":officeHoursTextView] as [String:Any]
    configureConstraint(with: "V:|[v1(130)][v2(175)]-2-[v3(40)][v4]|", to: self.view, of:viewsDictionary)

  }
  
  // MARK: Format Text
  internal var nonlinkAttributes: [String:Any] {
    get { return makeAttribute(withSize: 22.0,
                               weight: UIFontWeightLight,
                               ofColor: .black,
                               textAlignment: .right) }
  }
  
  internal var linkAttributes: [String:Any] {
    get { return makeAttribute(withSize: 21.5,
                               weight: UIFontWeightLight,
                               ofColor: ColorScheme.primaryColor,
                               textAlignment: .right) }
  }
  
  internal func appendAttributeText(of text:String,with attributes:[String:Any],to attrText: NSMutableAttributedString) {
    let textToAttribute = NSMutableAttributedString(string: text)
    textToAttribute.addAttributes(attributes, range: NSRange(0..<text.characters.count))
    attrText.append(textToAttribute)
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
  
  func makeAttribute(withSize size:CGFloat,
                     weight: CGFloat,
                     ofColor textColor:UIColor,
                     textAlignment:NSTextAlignment) -> [String:Any] {
    let fontAttribute = UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
    let style = NSMutableParagraphStyle()
    style.alignment = .right
    let customAttribute = [ NSForegroundColorAttributeName : textColor,
                            NSFontAttributeName : fontAttribute,
                            NSParagraphStyleAttributeName : style]
    return customAttribute
  }
}
