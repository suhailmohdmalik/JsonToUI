//
//  ProductBaseObject.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct ProductBaseObject : Codable {

	let products : [Products]
	let facets : Facets?
	let filters : Filters?
	let on_sale_count : Int?
	let status : Status?
	let total : Int?
	let page : Int?
	let page_size : Int?
	let meta : Meta?
	let title : String?
	let images : Images?

	enum CodingKeys: String, CodingKey {

		case products = "products"
		case facets = "facets"
		case filters = "filters"
		case on_sale_count = "on_sale_count"
		case status = "status"
		case total = "total"
		case page = "page"
		case page_size = "page_size"
		case meta = "meta"
		case title = "title"
		case images = "images"
	}

	init(from decoder: Decoder) throws {

		let values = try decoder.container(keyedBy: CodingKeys.self)
		products = try values.decodeIfPresent([Products].self, forKey: .products)!
		facets = try values.decodeIfPresent(Facets.self, forKey: .facets)
		filters = try values.decodeIfPresent(Filters.self, forKey: .filters)
		on_sale_count = try values.decodeIfPresent(Int.self, forKey: .on_sale_count)
		status = try values.decodeIfPresent(Status.self, forKey: .status)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		page_size = try values.decodeIfPresent(Int.self, forKey: .page_size)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
	}
}
