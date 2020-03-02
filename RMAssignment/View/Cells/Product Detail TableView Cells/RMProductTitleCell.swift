//
//  RMProductTitleCell.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

class RMProductTitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
	@IBOutlet weak var weightageLabel: UILabel?

    var item: RMViewModelItem? {
        didSet {
            guard let item = item as? RMViewModelNamePictureItem else {
                return
            }
			titleLabel?.text = item.title
			weightageLabel?.text = item.weightage
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
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }    
}
