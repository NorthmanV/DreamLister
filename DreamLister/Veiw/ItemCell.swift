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
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.locale = Locale(identifier: "ru_RU")
        let str = formatter.string(from: item.price.rounded() as NSNumber)
        price.text = "₽ " + str!
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }

}
