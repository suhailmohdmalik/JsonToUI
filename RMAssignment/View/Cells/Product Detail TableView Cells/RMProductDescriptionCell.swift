//
//  RMProductDescriptionCell.swift
//  RMAssignment
//
//  Created by suhail on 09/09/18.
//  Copyright © 2018 Suhail Mohd. All rights reserved.
//

import UIKit

class RMProductDescriptionCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel?
    
    var item: RMViewModelItem? {
        didSet {
            guard  let item = item as? RMViewModelAboutItem else {
                return
            }
            aboutLabel?.text = item.about
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
