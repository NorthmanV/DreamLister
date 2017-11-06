//
//  ItemCell.swift
//  DreamLister
//
//  Created by Руслан Акберов on 04.11.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item) {
        title.text = item.title
        price.text = "₽ " + String(format: "%.0f", item.price.rounded())
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }

}
