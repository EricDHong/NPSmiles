//
//  StateController.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/19/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class StateController {
  
  private(set) var items = [NewsItem]()
  
  func addItem(item: NewsItem) {
    items.append(item)
  }
  
  func save() {
  }

}
