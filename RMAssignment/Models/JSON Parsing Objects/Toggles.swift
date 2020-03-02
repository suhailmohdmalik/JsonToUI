//
//  Toggles.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//
import Foundation

struct Toggles : Codable {

	let name : String?
	let uri : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case uri = "uri"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
	}
}
