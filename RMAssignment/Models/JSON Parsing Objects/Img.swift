//
//  Img.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Img : Codable {

	let height : Int?
	let width : Int?
	let name : String?
	let position : Int?

	enum CodingKeys: String, CodingKey {

		case height = "h"
		case width = "w"
		case name = "name"
		case position = "position"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		position = try values.decodeIfPresent(Int.self, forKey: .position)
	}
}
