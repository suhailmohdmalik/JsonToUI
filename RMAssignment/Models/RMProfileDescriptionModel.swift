//
//  RMProfileDescriptionModel.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

import UIKit

enum RMViewModelItemType {

	case titleAndWeightage
	case cost
	case about
	case details
}

protocol RMViewModelItem {

	var type: RMViewModelItemType { get }
	var sectionTitle: String { get }
	var rowCount: Int { get }
}

class RMViewModel: NSObject {

	var items = [RMViewModelItem]()

	init(productObjcect:Products) {

		// Title and weight
		if let title = productObjcect.title , let weightage = productObjcect.measure?.wt_or_vol {
			let item = RMViewModelNamePictureItem(name: title, pictureUrl: weightage)
			items.append(item)
		}

		//Cost detsils
		if let actualCost = productObjcect.pricing?.price {
			let discountedPrice = productObjcect.pricing?.promo_price
			let savingText = productObjcect.pricing?.savings_text
			let item = RMViewModelCostItem(price: actualCost, promoPrice: discountedPrice, discountText: savingText)
			items.append(item)
		}

		//About : Description
		if let description = productObjcect.desc {
			let item = RMViewModelAboutItem(about: description)
			items.append(item)
		}

		//Other Details: Storage, Country of origin
		let storage = productObjcect.details?.storageClass
		let countryOfOrigin = productObjcect.details?.countryOfOrigin

		if storage != nil || countryOfOrigin != nil {
			var attributes = [Attribute]()

			attributes.append(Attribute(json: ["key" : "Country Of Origin", "value": countryOfOrigin! ]))
			attributes.append(Attribute(json: ["key" : "Storage", "value": storage! ]))
			let item = RMViewModeAttributeItem(attributes: attributes)
			items.append(item)
		}
	}
}

extension RMViewModel: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items[section].rowCount
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let item = items[indexPath.section]

		switch item.type {
		case .titleAndWeightage:
			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductTitleCell.identifier, for: indexPath) as? RMProductTitleCell {
				cell.item = item
				return cell
			}
		case .about:
			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductDescriptionCell.identifier, for: indexPath) as? RMProductDescriptionCell {
				cell.item = item
				return cell
			}
		case .cost:
			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductPricingDetailsCell.identifier, for: indexPath) as? RMProductPricingDetailsCell {
				cell.item = item
				return cell
			}
		case .details:
			if let item = item as? RMViewModeAttributeItem, let cell = tableView.dequeueReusableCell(withIdentifier: RMProducrOtherDetailsCell.identifier, for: indexPath) as? RMProducrOtherDetailsCell {
				cell.item = item.attributes[indexPath.row]
				return cell			}
		}
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return items[section].sectionTitle
	}
}

class RMViewModelNamePictureItem: RMViewModelItem {

	var type: RMViewModelItemType {
		return .titleAndWeightage
	}

	var sectionTitle: String {
		return "Item details"
	}

	var rowCount: Int {
		return 1
	}

	var title: String
	var weightage: String

	init(name: String, pictureUrl: String) {
		self.title = name
		self.weightage = pictureUrl
	}
}

class RMViewModelCostItem: RMViewModelItem {

	var type: RMViewModelItemType {
		return .cost
	}

	var sectionTitle: String {
		return "Pricing"
	}

	var rowCount: Int {
		return 1
	}

	var price: Double
	var promoPrice: Double?
	var discountText: String?

	init(price: Double, promoPrice:Double?, discountText:String?) {

		self.price = price
		self.discountText = discountText
		self.promoPrice = promoPrice
	}
}

class RMViewModelAboutItem: RMViewModelItem {

	var type: RMViewModelItemType {
		return .about
	}

	var sectionTitle: String {
		return "Description"
	}

	var rowCount: Int {
		return 1
	}

	var about: String

	init(about: String) {
		self.about = about
	}
}

class RMViewModeAttributeItem: RMViewModelItem {
	var type: RMViewModelItemType {
		return .details
	}

	var sectionTitle: String {
		return "Other details"
	}

	var rowCount: Int {
		return attributes.count
	}

	var attributes: [Attribute]

	init(attributes: [Attribute]) {
		self.attributes = attributes
	}
}

class Attribute {
	var key: String?
	var value: String?

	init(json: [String: Any]) {
		self.key = json["key"] as? String
		self.value = json["value"] as? String
	}
}
