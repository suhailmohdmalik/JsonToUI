//
//  RMImageManager.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit


private let _singletonInstance = RMImageManager()
private let kLazyLoadMaxCacheImageSize = 20

class RMImageManager: NSObject {
	var imageCache = [String: UIImage]()

	static var sharedInstance: RMImageManager { return _singletonInstance }

	func cacheImage(_ image: UIImage, forURL url: String) {

		if imageCache.count > kLazyLoadMaxCacheImageSize { // free old images first.
			imageCache.remove(at: imageCache.startIndex)
		}
		imageCache[url] = image
	}

	func cachedImageForURL(_ url: String) -> UIImage? { return imageCache[url] }

	func clearCache() { imageCache.removeAll() }

	func downloadImageFromURL(_ urlString: String, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?) {

		if let cachedImage = cachedImageForURL(urlString) {
			DispatchQueue.main.async(execute: {completion?(true, cachedImage) })
			return
		}
		if let url = URL(string: urlString) { // download from URL asynchronously
			let session = URLSession.shared
			let downloadTask = session.downloadTask(with: url, completionHandler: { (retrievedURL, response, error) -> Void in
				var found = false
				if error != nil { print("Error downloading image \(url.absoluteString): \(error!.localizedDescription)") }
				else if retrievedURL != nil {
					if let data = try? Data(contentsOf: retrievedURL!) {
						if let image = UIImage(data: data) {
							found = true
							self.cacheImage(image, forURL: url.absoluteString)
							DispatchQueue.main.async(execute: { completion?(true, image) });
						}
					}
				}
				if !found { DispatchQueue.main.async(execute: { completion?(false, nil) }); }
			})
			downloadTask.resume()
		} else { completion?(false, nil) }
	}
}
