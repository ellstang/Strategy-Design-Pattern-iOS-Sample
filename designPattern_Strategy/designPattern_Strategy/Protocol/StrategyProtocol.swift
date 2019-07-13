//
//  StrategyProtocol.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import Foundation

public protocol ReviewFetchable {
  // 1
  var reviewSourceServiceName: String { get }
  // 2
  func fetchReviews(for movieTitle: String, success: (ReviewPresentable?) -> ())
}

public protocol ReviewPresentable{
  var source: String { get }
  var score: Double { get }
  var comment: String? { get }
}
