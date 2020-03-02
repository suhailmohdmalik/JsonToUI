//
//  ProductDetailsViewController.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	let product:Products!
	let viewModel:RMViewModel!

	init(productDetails: Products) {
		self.product = productDetails
		self.viewModel = RMViewModel(productObjcect: productDetails)
		super.init(nibName: "ProductDetailsViewController", bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {

		super.viewDidLoad()
		tableView.dataSource = viewModel
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension

		tableView.register(RMProductDescriptionCell.nib, forCellReuseIdentifier: RMProductDescriptionCell.identifier)
		tableView.register(RMProductTitleCell.nib, forCellReuseIdentifier: RMProductTitleCell.identifier)
		tableView.register(RMProducrOtherDetailsCell.nib, forCellReuseIdentifier: RMProducrOtherDetailsCell.identifier)
		tableView.register(RMProductPricingDetailsCell.nib, forCellReuseIdentifier: RMProductPricingDetailsCell.identifier)

		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = UITableViewAutomaticDimension
		self.tableView.reloadData()

		let headerView = RMPrductDetailsImageHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
		headerView.createPageViewController(images: product.images!)
		headerView.backgroundColor = UIColor.white
		self.tableView.tableHeaderView = headerView
	}
}
