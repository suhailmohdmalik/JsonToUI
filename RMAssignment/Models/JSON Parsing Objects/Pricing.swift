//
//  Pricing.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Pricing : Codable {

	let on_sale : Int?
	let price : Double?
	let promo_price : Double?
	let savings : Double?
	let savings_type : Int?
	let savings_text : String?

	enum CodingKeys: String, CodingKey {

		case on_sale = "on_sale"
		case price = "price"
		case promo_price = "promo_price"
		case savings = "savings"
		case savings_type = "savings_type"
		case savings_text = "savings_text"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		on_sale = try values.decodeIfPresent(Int.self, forKey: .on_sale)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		promo_price = try values.decodeIfPresent(Double.self, forKey: .promo_price)
		savings = try values.decodeIfPresent(Double.self, forKey: .savings)
		savings_type = try values.decodeIfPresent(Int.self, forKey: .savings_type)
		savings_text = try values.decodeIfPresent(String.self, forKey: .savings_text)
	}
}
