//
//  Products.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Products : Codable {

	let pricing : Pricing?
	let id : Int?
	let title : String?
	let desc : String?
	let sample_type : String?
	let measure : Measure?
	let details : Details?
	let images : [Images]?
	let warehouse : Warehouse?
	let sku : String?
	let filters : Filters?
	let categories : [Int]?
	let types : [Int]?
	let category_tags : [String]?
	let img : Img?
	let product_life : Product_life?
	let description_fields : Description_fields?
	let labels : [String]?
	let promotions : [Promotions]?
	let pr : Int?
	let inventory : Inventory?
	let inventories : [Inventories]?

	enum CodingKeys: String, CodingKey {

		case pricing = "pricing"
		case id = "id"
		case title = "title"
		case desc = "desc"
		case sample_type = "sample-type"
		case measure = "measure"
		case details = "details"
		case images = "images"
		case warehouse = "warehouse"
		case sku = "sku"
		case filters = "filters"
		case categories = "categories"
		case types = "types"
		case category_tags = "category_tags"
		case img = "img"
		case product_life = "product_life"
		case description_fields = "description_fields"
		case labels = "labels"
		case promotions = "promotions"
		case pr = "pr"
		case inventory = "inventory"
		case inventories = "inventories"
	}

	init(from decoder: Decoder) throws {

		let values = try decoder.container(keyedBy: CodingKeys.self)
		pricing = try values.decodeIfPresent(Pricing.self, forKey: .pricing)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		desc = try values.decodeIfPresent(String.self, forKey: .desc)
		sample_type = try values.decodeIfPresent(String.self, forKey: .sample_type)
		measure = try values.decodeIfPresent(Measure.self, forKey: .measure)
		details = try values.decodeIfPresent(Details.self, forKey: .details)
		images = try values.decodeIfPresent([Images].self, forKey: .images)
		warehouse = try values.decodeIfPresent(Warehouse.self, forKey: .warehouse)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		filters = try values.decodeIfPresent(Filters.self, forKey: .filters)
		categories = try values.decodeIfPresent([Int].self, forKey: .categories)
		types = try values.decodeIfPresent([Int].self, forKey: .types)
		category_tags = try values.decodeIfPresent([String].self, forKey: .category_tags)
		img = try values.decodeIfPresent(Img.self, forKey: .img)
		product_life = try values.decodeIfPresent(Product_life.self, forKey: .product_life)
		description_fields = try values.decodeIfPresent(Description_fields.self, forKey: .description_fields)
		labels = try values.decodeIfPresent([String].self, forKey: .labels)
		promotions = try values.decodeIfPresent([Promotions].self, forKey: .promotions)
		pr = try values.decodeIfPresent(Int.self, forKey: .pr)
		inventory = try values.decodeIfPresent(Inventory.self, forKey: .inventory)
		inventories = try values.decodeIfPresent([Inventories].self, forKey: .inventories)
	}
}
