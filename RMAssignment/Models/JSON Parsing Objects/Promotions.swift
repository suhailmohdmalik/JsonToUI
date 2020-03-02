//
//  Promotions.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Promotions : Codable {

	let id : Int?
	let type : Int?
	let savings_text : String?
	let promo_label : String?
	let current_product_group_id : Int?
	let products : [Products]?
	let has_free_gift : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case type = "type"
		case savings_text = "savings_text"
		case promo_label = "promo_label"
		case current_product_group_id = "current_product_group_id"
		case products = "products"
		case has_free_gift = "has_free_gift"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		savings_text = try values.decodeIfPresent(String.self, forKey: .savings_text)
		promo_label = try values.decodeIfPresent(String.self, forKey: .promo_label)
		current_product_group_id = try values.decodeIfPresent(Int.self, forKey: .current_product_group_id)
		products = try values.decodeIfPresent([Products].self, forKey: .products)
		has_free_gift = try values.decodeIfPresent(Bool.self, forKey: .has_free_gift)
	}
}
