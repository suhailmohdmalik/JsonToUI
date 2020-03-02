//
//  Atp_lots.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Atp_lots : Codable {
	
	let from_date : String?
	let to_date : String?
	let stock_status : Int?
	let qty_in_stock : Int?
	let qty_in_carts : Int?

	enum CodingKeys: String, CodingKey {

		case from_date = "from_date"
		case to_date = "to_date"
		case stock_status = "stock_status"
		case qty_in_stock = "qty_in_stock"
		case qty_in_carts = "qty_in_carts"
	}

	init(from decoder: Decoder) throws {

		let values = try decoder.container(keyedBy: CodingKeys.self)
		from_date = try values.decodeIfPresent(String.self, forKey: .from_date)
		to_date = try values.decodeIfPresent(String.self, forKey: .to_date)
		stock_status = try values.decodeIfPresent(Int.self, forKey: .stock_status)
		qty_in_stock = try values.decodeIfPresent(Int.self, forKey: .qty_in_stock)
		qty_in_carts = try values.decodeIfPresent(Int.self, forKey: .qty_in_carts)
	}
}
