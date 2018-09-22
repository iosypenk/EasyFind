//
//  PlacesViewCell.swift
//  Introduction-to-iOS
//
//  Created by Ivan OSYPENKO on 9/22/18.
//  Copyright © 2018 iosypenk's & mrybak team. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 10
    }
    
    func initCell(place: Place) {
        placeName.text = place.title
    }

}
