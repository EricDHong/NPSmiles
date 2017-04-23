//
//  NewsItem.swift
//  NPSmiles
//
//  Created by Eric Hong on 4/19/17.
//  Copyright © 2017 EricDHong. All rights reserved.
//

import UIKit

class NewsItem {
  let headerText: String
  let bodyText: String
  let date: Date
  
  init(headerText: String, bodyText: String, date: Date) {
    self.headerText = headerText
    self.bodyText = bodyText
    self.date = date
  }

}
