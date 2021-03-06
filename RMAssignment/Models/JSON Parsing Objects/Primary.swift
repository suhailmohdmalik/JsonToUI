//
//  Primary.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Primary : Codable {

	let name : String?
	let content : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case content = "content"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		content = try values.decodeIfPresent(String.self, forKey: .content)
	}
}
