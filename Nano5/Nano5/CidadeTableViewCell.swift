//
//  CidadeTableViewCell.swift
//  Nano5
//
//  Created by Rafael Costa on 23/02/21.
//

import UIKit

class CidadeTableViewCell: UITableViewCell {

    @IBOutlet weak var TemperaturaCidade: UILabel!
    @IBOutlet weak var NomeCidade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
