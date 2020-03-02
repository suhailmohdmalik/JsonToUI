//
//  Details.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Details : Codable {

	let status : Int?
	let productType : Int?
	let uri : String?
	let countryOfOrigin : String?
	let storageClass : String?
	let isNew : Int?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case productType = "prod_type"
		case uri = "uri"
		case countryOfOrigin = "country_of_origin"
		case storageClass = "storage_class"
		case isNew = "is_new"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		productType = try values.decodeIfPresent(Int.self, forKey: .productType)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		countryOfOrigin = try values.decodeIfPresent(String.self, forKey: .countryOfOrigin)
		storageClass = try values.decodeIfPresent(String.self, forKey: .storageClass)
		isNew = try values.decodeIfPresent(Int.self, forKey: .isNew)
	}
}
