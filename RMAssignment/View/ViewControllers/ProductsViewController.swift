//
//  ProductsViewController.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

private let kLazyLoadScreenSize = UIScreen.main.bounds.width
private let kLazyLoadColumnsPerRow: CGFloat = 3.0
private let kMinimumInterSpacing : CGFloat = 5.0

class ProductsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	let apiModelObj = APICallerModel()
	var redMardData:ProductBaseObject?
	@IBOutlet weak var collectionView: UICollectionView!

	var images_cache = [String:UIImage]()
	var cellSize = CGSize.zero
	var entries: [String] = []

    override func viewDidLoad() {

		super.viewDidLoad()
		self.calculateCellWidth()
		self.activityIndicator.startAnimating()
		apiModelObj.fetchDataFromURL { [weak self] (obj) in
			if let blockSelf = self {
				blockSelf.activityIndicator.stopAnimating()
				if obj.errorMessage != nil {
					DispatchQueue.main.async {
						blockSelf.displayAlertWithMessage(message: obj.errorMessage!)
					}
					return
				}
				blockSelf.redMardData = obj.resultObject
				DispatchQueue.main.async {
					blockSelf.setUpUserInterface()
				}
			}
		}
    }

	private final func setUpUserInterface() {
	RMProductCollectionViewCell.registerCellForCollectionView(self.collectionView)
		self.setUpNavigationBar()
		let products = self.redMardData!.products
		for item in products {
			entries.append(Constants.baseURLString + item.img!.name!)
		}
		self.collectionView.reloadData()
	}

	private final func setUpNavigationBar() {
		self.navigationItem.title = "Products"
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return entries.count
	}

	func calculateCellWidth() {
		let dimension = (kLazyLoadScreenSize - (kMinimumInterSpacing * 4)) / kLazyLoadColumnsPerRow
		self.cellSize = CGSize(width: dimension, height: dimension)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return cellSize
	}

	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = RMProductCollectionViewCell.reusableCellForCollectionView(collectionView, indexPath: indexPath)

		if (images_cache[entries[indexPath.row]] != nil) {
			cell.iconImageView.image = images_cache[entries[indexPath.row]]
		}else {
			load_image(entries[indexPath.row], imageview:cell.iconImageView)
		}

		cell.setAttributedTextForServiceLabel(description: redMardData!.products[indexPath.row].title!, price: String(redMardData!.products[indexPath.row].pricing!.price!))

		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.view.isUserInteractionEnabled = false
		let cell = collectionView.cellForItem(at: indexPath) as! RMProductCollectionViewCell
		let producDetailsVC = ProductDetailsViewController(productDetails: redMardData!.products[indexPath.row])
		self.setBounceAnimationForView(cell)

		let delayTime = DispatchTime.now() + Double(Int64(0.2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
		DispatchQueue.main.asyncAfter(deadline: delayTime) {
			self.navigationController?.pushViewController(producDetailsVC, animated: true)
			self.view.isUserInteractionEnabled = true
		}
	}

	private func load_image(_ link:String, imageview:UIImageView) {
		let url:URL = URL(string: link)!
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
					self.images_cache[link] = image
					imageview.image = image
				}
				DispatchQueue.main.async(execute: set_image)
			}
		})
		task.resume()
	}

	private func displayAlertWithMessage(message:String) {
		let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
		self.present(alert, animated: true)
	}
}

extension ProductsViewController {

	fileprivate func setBounceAnimationForView(_ addEmailServiceItem: UICollectionViewCell) {
		self.setAnchorPointFor(addEmailServiceItem)
		addEmailServiceItem.layer.add(self.createBounceAnimation(), forKey: nil)
	}

	fileprivate func setAnchorPointFor(_ view: UIView) {
		let frame = view.layer.frame
		let center = CGPoint(x: frame.midX, y: frame.midY)
		view.layer.position = center
		view.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
	}

	fileprivate func createBounceAnimation() -> CAKeyframeAnimation {
		let bounceAnimation = CAKeyframeAnimation(keyPath: "transform")
		bounceAnimation.values = [
			NSValue(caTransform3D: CATransform3DIdentity),
			NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9)),
			NSValue(caTransform3D: CATransform3DIdentity)
		]

		bounceAnimation.duration = 0.25
		bounceAnimation.isRemovedOnCompletion = true
		bounceAnimation.fillMode = kCAFillModeForwards

		return bounceAnimation
	}
}
