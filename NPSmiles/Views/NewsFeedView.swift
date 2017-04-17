//
//  NewsFeedView.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class NewsFeedView: UIViewController {
  
  private let flowLayout = UICollectionViewFlowLayout()
  internal var newsFeed:UICollectionView?

  override func loadView() {
    super.loadView()
    setupNewsFeed()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Feed"
    
  }
  
  private func setupNewsFeed() {
    newsFeed = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    flowLayout.minimumLineSpacing = 1.0
    newsFeed?.backgroundColor = .red
    newsFeed?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    view.addSubview(newsFeed!)
    newsFeed?.translatesAutoresizingMaskIntoConstraints = false
    configureConstraint(with: "H:|[v0]|", to: view, of: ["v0":newsFeed!])
    configureConstraint(with: "V:|[v0]|", to: view, of: ["v0":newsFeed!])
  }
}
