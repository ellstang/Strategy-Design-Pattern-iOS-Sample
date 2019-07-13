//
//  ViewModel.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import Foundation

final class ViewModel {
  
  private(set) var reviews: [ReviewPresentable] = []
  
  func fetchReviews(completion: @escaping (_ fetchResults: [ReviewPresentable]) -> Void) {
    let imbdClient = IMDbClient()
    let rottenTomatoClient = AtromTicketsClient()
    
    let dispatchGroup = DispatchGroup()
    dispatchGroup.enter()
    imbdClient.fetchReviews(for: "dummyStr") { review in
      if let review = review {
        reviews.append(review)
      }
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    rottenTomatoClient.fetchReviews(for: "dummyStr") { review in
      if let review = review {
        reviews.append(review)
      }
      dispatchGroup.leave()
    }
    dispatchGroup.notify(queue: .init(label: "clientQueue"), work: DispatchWorkItem(block: { [weak self] in
      guard let `self` = self else { return }
      completion(self.reviews)
    }))
  }
  
}
