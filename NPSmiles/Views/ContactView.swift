//
//  ContactView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

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
    let views = [legalNameLabel, contactInfoTextView]
    for view in views {
      self.view.addSubview(view)
    }
  }
  
  private func disableAutoresizingMaskIntoConstraints() {
    legalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    contactInfoTextView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    viewsDictionary = ["v0":legalNameLabel, "v1":contactInfoTextView] as [String:Any]
    disableAutoresizingMaskIntoConstraints()
    
    let height = self.navigationController?.navigationBar.frame.size.height
    let padding = height! + 15
    let navBarHeight = String(describing: padding)
    
    configureConstraint(with: "H:|-8-[v0]-8-|", to: self.view, of: viewsDictionary!)
    configureConstraint(with: "H:|-8-[v1]-8-|", to: self.view, of: viewsDictionary!)
    configureConstraint(with: "V:|-\(navBarHeight)-[v0(50)][v1(150)]",
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
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    let font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    let attributes = [NSForegroundColorAttributeName : textColor,
                                 NSFontAttributeName : font,
                       NSParagraphStyleAttributeName : style
    ]
    let attributedText = NSMutableAttributedString(string: textsnippet, attributes: attributes)
    return attributedText
  }
}
