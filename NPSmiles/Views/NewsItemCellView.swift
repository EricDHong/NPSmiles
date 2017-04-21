//
//  NewsItemCellView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/19/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class NewsItemCellView: UICollectionViewCell {
  
  // Views
  let newsItemImageView: UIImageView = {
    let image = UIImage(named: NorthPotomacSmiles.newsItemImageIcon)
    let imageView = UIImageView(image: image)
    return imageView
  }()
  
  let headerTextLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18.0, weight: UIFontWeightRegular)
    label.textColor = ColorScheme.darkGrey
    label.backgroundColor = .blue
    return label
  }()
  
  let bodyTextView: UITextView = {
    let textView = UITextView()
    textView.isEditable = false
    textView.isSelectable = false
    textView.backgroundColor = .red
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupViews()
  }
  
  func setupViews() {
    self.addSubview(newsItemImageView)
    self.addSubview(headerTextLabel)
    self.addSubview(bodyTextView)
    setupConstraints()
  }
  
  func disableAutresizingMaskIntoConstraints() {
    newsItemImageView.translatesAutoresizingMaskIntoConstraints = false
    headerTextLabel.translatesAutoresizingMaskIntoConstraints = false
    bodyTextView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setupConstraints() {
    disableAutresizingMaskIntoConstraints()
    let viewsDictionary = ["v0" : newsItemImageView, "v1" : headerTextLabel, "v2" : bodyTextView]
    
    configureConstraint(with: "H:|-8-[v0(50)]-4-[v1]-8-|", to: self, of: viewsDictionary)
    configureConstraint(with: "H:|-8-[v2]-8-|", to: self, of: viewsDictionary)
    configureConstraint(with: "V:|-4-[v0(50)]-2-[v2]-4-|", to: self, of: viewsDictionary)
    configureConstraint(with: "V:|-4-[v1(50)]-2-[v2]-4-|", to: self, of: viewsDictionary)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension UICollectionViewCell {
  func configureConstraint(with visualFormat:String, to view:UIView, of dictionaryViews:[String:Any]) {
    let constraint = NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                    options: NSLayoutFormatOptions(),
                                                    metrics: nil,
                                                    views: dictionaryViews)
    view.addConstraints(constraint)
  }
}
