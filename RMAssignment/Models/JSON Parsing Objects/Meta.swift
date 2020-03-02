//
//  Meta.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Meta : Codable {

	let title : String?
	let desc : String?
	let keywordswords : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case desc = "desc"
		case keywordswords = "keywordswords"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		desc = try values.decodeIfPresent(String.self, forKey: .desc)
		keywordswords = try values.decodeIfPresent(String.self, forKey: .keywordswords)
	}
}
