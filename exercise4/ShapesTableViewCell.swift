//
//  ShapesTableViewCell.swift
//  exercise4
//
//  Created by Scores_Main_User on 1/5/21.
//

import UIKit

class ShapesTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with data:Shape)
    {
        self.TitleLabel.text = data.name
        self.DetailLabel.text = data.numOfVertices
    }

}
