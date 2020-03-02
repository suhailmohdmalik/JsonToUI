//
//  Description_fields.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Description_fields : Codable {

	let primary : [Primary]?

	enum CodingKeys: String, CodingKey {

		case primary = "primary"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		primary = try values.decodeIfPresent([Primary].self, forKey: .primary)
	}
}
