//
//  Filters.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Filters : Codable {

	let options : [Options]?
	let toggles : [Toggles]?

	enum CodingKeys: String, CodingKey {

		case options = "options"
		case toggles = "toggles"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		options = try values.decodeIfPresent([Options].self, forKey: .options)
		toggles = try values.decodeIfPresent([Toggles].self, forKey: .toggles)
	}
}
