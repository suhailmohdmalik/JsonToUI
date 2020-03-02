//
//  Categories.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Categories : Codable {

	let id : Int?
	let name : String?
	let uri : String?
	let count : Int?
	let image : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case uri = "uri"
		case count = "count"
		case image = "image"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		image = try values.decodeIfPresent(String.self, forKey: .image)
	}
}
