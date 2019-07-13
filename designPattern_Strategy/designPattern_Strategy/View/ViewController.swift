//
//  ViewController.swift
//  designPattern_Strategy
//
//  Created by Tang, Chia Ling on 2019/6/23.
//  Copyright © 2019 cltang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var reviewTableview: UITableView!
  
  private var viewModel: ViewModel = ViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareView()
    viewModel.fetchReviews { [weak self] fetchedResults in
      guard let `self` = self else { return }
      // either client is success, reload data
      if fetchedResults.count > 0 {
        self.reviewTableview.reloadData()
      }
    }
  }
  
  private func prepareView() {
    reviewTableview.delegate = self
    reviewTableview.dataSource = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.reviews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReviewCell.self), for: indexPath)
    if let reviewCell = cell as? ReviewCell {
      let review = viewModel.reviews[indexPath.row]
      reviewCell.prepareCell(with: review)
    }
    return cell
  }
  
  
}

extension ViewController: UITableViewDelegate {
  
}
