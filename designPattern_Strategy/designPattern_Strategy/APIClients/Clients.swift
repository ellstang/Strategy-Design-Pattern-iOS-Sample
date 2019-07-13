//
//  Clients.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import Foundation
public class AtromTicketsClient: ReviewFetchable {
  public let reviewSourceServiceName = "Atrom Tickets"
  
  public func fetchReviews(for movieTitle: String, success: (ReviewPresentable?) -> ()) {
    // In a real service, you’d make a network request...
    // Here, we just provide dummy values...
    let rating: Double = 94.5
    let comment: String = "It rocked!"
    let review: ReviewPresentable = AtomTicketsReview(source: reviewSourceServiceName, score: rating, comment: comment)
    success(review)
  }
}

public class IMDbClient: ReviewFetchable {
  public let reviewSourceServiceName = "IMDbClient"
  
  public func fetchReviews(for movieTitle: String, success: (ReviewPresentable?) -> ()) {
    let rating: Double = (0.35 * 100)
    let comment: String = "It rocked!"
    let review: ReviewPresentable = IMDbReview(source: reviewSourceServiceName, score: rating, comment: comment)
    success(review)
  }
}
