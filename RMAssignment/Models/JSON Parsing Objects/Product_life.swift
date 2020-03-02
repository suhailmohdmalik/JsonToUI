//
//  Product_life.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Product_life : Codable {

	let time : Int?
	let metric : String?
	let is_minimum : Bool?
	let time_including_delivery : Int?

	enum CodingKeys: String, CodingKey {

		case time = "time"
		case metric = "metric"
		case is_minimum = "is_minimum"
		case time_including_delivery = "time_including_delivery"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		time = try values.decodeIfPresent(Int.self, forKey: .time)
		metric = try values.decodeIfPresent(String.self, forKey: .metric)
		is_minimum = try values.decodeIfPresent(Bool.self, forKey: .is_minimum)
		time_including_delivery = try values.decodeIfPresent(Int.self, forKey: .time_including_delivery)
	}
}
