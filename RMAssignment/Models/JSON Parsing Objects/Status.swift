//
//  Status.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Status : Codable {

	let msg : String?
	let code : Int?

	enum CodingKeys: String, CodingKey {

		case msg = "msg"
		case code = "code"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		msg = try values.decodeIfPresent(String.self, forKey: .msg)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
	}
}
