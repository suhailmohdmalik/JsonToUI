//
//  RMPageItemViewController.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

protocol RMPageItemViewControllerProtocol: NSObjectProtocol
{
	func protocolMethod(link:String, imgage:UIImage)
	func getImageForUrl(link:String) -> UIImage?
}

class RMPageItemViewController: UIViewController {

	var itemIndex: Int = 0
	var totalSlides: Int = 0
	weak var delegate:RMPageItemViewControllerProtocol?
	var contentImageURL: String = ""

	@IBOutlet var contentImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.load_image()
    }

	private func load_image() {

		if let cachedImage = self.delegate!.getImageForUrl(link: contentImageURL) {
			self.contentImageView!.image = cachedImage
			return
		}

		let url:URL = URL(string: contentImageURL)!
		let session = URLSession.shared

		let request = NSMutableURLRequest(url: url)
		request.timeoutInterval = 10

		let task = session.dataTask(with: request as URLRequest, completionHandler: {
			(
			data, response, error) in

			guard let _:Data = data, let _:URLResponse = response, error == nil else {
				return
			}
			var image = UIImage(data: data!)

			if (image != nil) {
				func set_image() {
					self.delegate!.protocolMethod(link: self.contentImageURL, imgage: image!)
					self.contentImageView?.image = image
				}
				DispatchQueue.main.async(execute: set_image)
			}
		})
		task.resume()
	}
}
