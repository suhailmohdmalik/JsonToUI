//
//  Inventories.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Inventories : Codable {

	let maxSaleQuantity : Int?
	let stockStatus : Int?
	let quantityInStock : Int?
	let qty_in_carts : Int?
	let next_available_date : String?
	let stock_type : Int?
	let atp_lots : [Atp_lots]?
	let limited_stock_status : Int?
	let delivery_option : String?

	enum CodingKeys: String, CodingKey {

		case maxSaleQuantity = "max_sale_qty"
		case stockStatus = "stock_status"
		case quantityInStock = "qty_in_stock"
		case qty_in_carts = "qty_in_carts"
		case next_available_date = "next_available_date"
		case stock_type = "stock_type"
		case atp_lots = "atp_lots"
		case limited_stock_status = "limited_stock_status"
		case delivery_option = "delivery_option"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		maxSaleQuantity = try values.decodeIfPresent(Int.self, forKey: .maxSaleQuantity)
		stockStatus = try values.decodeIfPresent(Int.self, forKey: .stockStatus)
		quantityInStock = try values.decodeIfPresent(Int.self, forKey: .quantityInStock)
		qty_in_carts = try values.decodeIfPresent(Int.self, forKey: .qty_in_carts)
		next_available_date = try values.decodeIfPresent(String.self, forKey: .next_available_date)
		stock_type = try values.decodeIfPresent(Int.self, forKey: .stock_type)
		atp_lots = try values.decodeIfPresent([Atp_lots].self, forKey: .atp_lots)
		limited_stock_status = try values.decodeIfPresent(Int.self, forKey: .limited_stock_status)
		delivery_option = try values.decodeIfPresent(String.self, forKey: .delivery_option)
	}
}
