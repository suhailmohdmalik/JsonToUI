//
//  RMProductCollectionViewCell.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

class RMProductCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!

	override func awakeFromNib() {

		super.awakeFromNib()
		self.layer.borderWidth = 0.5
		self.layer.cornerRadius = 2.0
		self.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
	}

    static func registerCellForCollectionView(_ collectionView:UICollectionView) {
        collectionView.register(UINib(nibName: "RMProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RMProductCollectionViewCell")
    }
    
    static func reusableCellForCollectionView(_ collectionView:UICollectionView, indexPath:IndexPath) -> RMProductCollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMProductCollectionViewCell", for: indexPath) as! RMProductCollectionViewCell
        return cell
    }
    
	final func setAttributedTextForServiceLabel(description:String, price:String)
    {
		let title = description.removeStringsWithinBrackets()

        self.titleLabel.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.black.withAlphaComponent(0.6),NSAttributedStringKey.kern: 0.3])

		self.priceLabel.attributedText = NSMutableAttributedString(string: "$\(price)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 8, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
    }
}
