//
//  UtilityClass.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

extension String {
	
	internal func removeStringsWithinBrackets() -> String {
		let trimmedTitle = self.replacingOccurrences(of: "\\s?\\([\\w\\s]*\\)", with: "", options: .regularExpression)
		let textAfterTrimmingOfSquareBrackets = trimmedTitle.replacingOccurrences(of: "\\[(.*?)\\]", with: "", options: .regularExpression)
		return textAfterTrimmingOfSquareBrackets;
	}
}

extension NSMutableAttributedString {
	
	public func strikeOfAttributedString(_ font:UIFont, color:UIColor, stringValue:String) -> Self
	{
		let discountedAttributes = [NSAttributedStringKey.foregroundColor: color,
									NSAttributedStringKey.backgroundColor: UIColor.clear,
									NSAttributedStringKey.strikethroughStyle: 1,
									NSAttributedStringKey.baselineOffset: NSNumber(value: 0),
									NSAttributedStringKey.font: font] as [NSAttributedStringKey : Any]
		self.addAttributes(discountedAttributes, range: NSRange(location:0,length:stringValue.count))
		return self
	}
}

extension UIView {

	//MARK: addFittingSubview
	func addFittingSubview(subView: UIView) -> (left: NSLayoutConstraint, right: NSLayoutConstraint, top: NSLayoutConstraint, bottom: NSLayoutConstraint) {

		let superView = self
		let view = subView

		superView.addSubview(view)

		view.translatesAutoresizingMaskIntoConstraints = false
		let left = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1.0, constant: 0.0)
		let right = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: superView, attribute: .right, multiplier: 1.0, constant: 0.0)
		let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1.0, constant: 0.0)
		let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1.0, constant: 0.0)

		NSLayoutConstraint.activate([left, right, top, bottom])
		return (left: left, right: right, top: top, bottom: bottom)
	}
}
