//
//  StateController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/19/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class StateController {
  
  fileprivate(set) var items = [NewsItem]()
  
  func addItem(_ item: NewsItem) {
    items.append(item)
  }
  
  func save() {
  }

}
