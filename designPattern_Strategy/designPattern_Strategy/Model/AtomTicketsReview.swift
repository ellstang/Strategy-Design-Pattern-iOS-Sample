//
//  Review.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import Foundation

struct AtomTicketsReview {
  var source: String
  var score: Double
  var comment: String?
}

extension AtomTicketsReview: ReviewPresentable {}

struct IMDbReview {
  var source: String
  var score: Double
  var comment: String?
}

extension IMDbReview: ReviewPresentable {}

