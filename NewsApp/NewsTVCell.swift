//
//  NewsTVCell.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 16/03/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import UIKit

class NewsTVCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
