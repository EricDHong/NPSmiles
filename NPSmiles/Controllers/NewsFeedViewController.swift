//
//  NewsFeedViewController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/15/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class NewsFeedViewController: NewsFeedView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    newsFeed?.dataSource = self
    newsFeed?.delegate = self
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
    cell.backgroundColor = .yellow
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let newsFeedSize = newsFeed?.bounds.size
    return CGSize(width: newsFeedSize!.width, height: 150)
  }

}
