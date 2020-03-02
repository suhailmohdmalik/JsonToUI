//
//  Warehouse.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Warehouse : Codable {

	let measure : Measure?

	enum CodingKeys: String, CodingKey {

		case measure = "measure"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		measure = try values.decodeIfPresent(Measure.self, forKey: .measure)
	}
}
