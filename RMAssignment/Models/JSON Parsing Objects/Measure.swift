//
//  Measure.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct Measure : Codable {

	let vol_metric_alt : String?
	let vol : Double?
	let wt_metric : String?
	let vol_metric : String?
	let wt : Double?
	let w : Double?
	let l : Double?
	let h : Double?
	let wt_or_vol : String?

	enum CodingKeys: String, CodingKey {

		case vol_metric_alt = "vol_metric_alt"
		case vol = "vol"
		case wt_metric = "wt_metric"
		case vol_metric = "vol_metric"
		case wt = "wt"
		case w = "w"
		case l = "l"
		case h = "h"
		case wt_or_vol = "wt_or_vol"
	}

	init(from decoder: Decoder) throws {

		let values = try decoder.container(keyedBy: CodingKeys.self)
		vol_metric_alt = try values.decodeIfPresent(String.self, forKey: .vol_metric_alt)
		vol = try values.decodeIfPresent(Double.self, forKey: .vol)
		wt_metric = try values.decodeIfPresent(String.self, forKey: .wt_metric)
		vol_metric = try values.decodeIfPresent(String.self, forKey: .vol_metric)
		wt = try values.decodeIfPresent(Double.self, forKey: .wt)
		w = try values.decodeIfPresent(Double.self, forKey: .w)
		l = try values.decodeIfPresent(Double.self, forKey: .l)
		h = try values.decodeIfPresent(Double.self, forKey: .h)
		wt_or_vol = try values.decodeIfPresent(String.self, forKey: .wt_or_vol)
	}
}
