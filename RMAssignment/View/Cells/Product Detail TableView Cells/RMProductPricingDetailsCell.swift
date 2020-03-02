//
//  RMProductPricingDetailsCell.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

class RMProductPricingDetailsCell: UITableViewCell {

	@IBOutlet weak var priceLabel: UILabel?
	@IBOutlet weak var discountedPriceTextDescriptionLabel: UILabel?

    var item: RMViewModelItem? {
        didSet {
            guard let item = item as? RMViewModelCostItem else {
                return
            }

			if item.promoPrice != nil && item.promoPrice! > 0 {
				priceLabel?.attributedText = self.formattedDiscountedPriceWithOrignalPriceSubtitleString(("$" + String(item.price)), discountedPrice: ("$" + String(item.promoPrice!)))
				if let percentageText = item.discountText {
					self.discountedPriceTextDescriptionLabel?.isHidden = false
					self.discountedPriceTextDescriptionLabel?.text = "  " + percentageText + "  "
				}
			}else {
				self.discountedPriceTextDescriptionLabel?.isHidden = true
				priceLabel?.text = "$" + "\(String(item.price))"
			}
        }
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

	override func awakeFromNib() {
		super.awakeFromNib()
		self.discountedPriceTextDescriptionLabel?.layer.cornerRadius = 3.0
	}


	fileprivate final func formattedDiscountedPriceWithOrignalPriceSubtitleString(_ orignalPrice:String, discountedPrice:String) -> NSAttributedString {
		let attrString = NSMutableAttributedString(string: "")
		let discountedPriceFont = UIFont.systemFont(ofSize: 14, weight: .bold)
		let orignalPriceFont = UIFont.systemFont(ofSize: 14, weight: .regular)
		
		let orignalPriceStringPerYear = orignalPrice
		let orignalAttributedString = NSMutableAttributedString(string: orignalPriceStringPerYear)
		_ = orignalAttributedString.strikeOfAttributedString(orignalPriceFont, color: UIColor.black.withAlphaComponent(0.7), stringValue: orignalPriceStringPerYear)
		
		let discountedPriceStringPerYear =  discountedPrice + "  "
		let discountedPriceAttrString = NSAttributedString(string: discountedPriceStringPerYear, attributes: [NSAttributedStringKey.font: discountedPriceFont,NSAttributedStringKey.foregroundColor: UIColor.red.withAlphaComponent(0.7)])
		
		attrString.append(discountedPriceAttrString)
		attrString.append(orignalAttributedString)
		
		return attrString
	}

}
