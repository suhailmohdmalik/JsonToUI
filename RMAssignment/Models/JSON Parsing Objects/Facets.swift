//
//  Facets.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Facets : Codable {

	let categories : [Categories]?

	enum CodingKeys: String, CodingKey {

		case categories = "categories"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
	}
}
