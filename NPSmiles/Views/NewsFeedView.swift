//
//  NewsFeedView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class NewsFeedView: UIViewController {
  
  fileprivate let flowLayout = UICollectionViewFlowLayout()
  internal var newsFeed:UICollectionView?

  override func loadView() {
    super.loadView()
    setupNewsFeed()
    setupNewsFeedProperties()
    constrainNewsFeed()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
  }
  
  fileprivate func setupNavBar() {
    self.navigationItem.title = "News"
    let font = UIFont.systemFont(ofSize: 25.0, weight: UIFontWeightThin)
    self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : font,
                                                                    NSForegroundColorAttributeName : ColorScheme.darkGrey]
  }
  
  fileprivate func setupNewsFeed() {
    newsFeed = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    newsFeed?.register(NewsItemCell.self, forCellWithReuseIdentifier: NewsItemCell.identifier)
    view.addSubview(newsFeed!)
  }
  
  fileprivate func setupNewsFeedProperties() {
    newsFeed?.backgroundColor = .white
    flowLayout.minimumLineSpacing = 1.0
  }
  
  fileprivate func constrainNewsFeed() {
    newsFeed?.translatesAutoresizingMaskIntoConstraints = false
    configureConstraint(with: "H:|[v0]|", to: view, of: ["v0":newsFeed!])
    configureConstraint(with: "V:|[v0]|", to: view, of: ["v0":newsFeed!])
  }
}
