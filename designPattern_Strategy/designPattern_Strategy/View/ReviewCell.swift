//
//  ReviewCell.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

  @IBOutlet weak var reviewScoreLabel: UILabel!
  @IBOutlet weak var reviewCommentLabel: UILabel!
  @IBOutlet weak var reviewSourceLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func prepareCell(with review: ReviewPresentable) {
    reviewScoreLabel.text = "\(review.score)"
    reviewCommentLabel.text = review.comment
    reviewSourceLabel.text = review.source
  }
  
}
