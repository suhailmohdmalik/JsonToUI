//
//  APICallerModel.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import Foundation

struct ResultObj {
	
	var resultObject: ProductBaseObject?
	var errorMessage: String?

	init(responseObject:ProductBaseObject?, error:String?) {
		self.resultObject = responseObject
		self.errorMessage = error
	}
}

struct APICallerModel {

	func fetchDataFromURL(completion: ((ResultObj) -> Void)? = nil) {
		DispatchQueue.global(qos: .userInitiated).async {

			guard let myURL = URL(string: Constants.URLString) else {
				DispatchQueue.main.async {
					completion!(ResultObj(responseObject: nil, error: Constants.errorDescription))
				}
				return
			}

			URLSession.shared.dataTask(with: myURL) { (data, response
				, error) in

				guard let data = data else { return }
				do {
					let test = try JSONDecoder().decode(ProductBaseObject.self, from: data)

					DispatchQueue.main.async {
						completion!(ResultObj(responseObject: test, error: nil))
					}

				} catch let err {
					DispatchQueue.main.async {
						completion!(ResultObj(responseObject: nil, error: Constants.errorDescription))
					}
					print("Err", err)
				}
				}.resume()
		}
	}
}
