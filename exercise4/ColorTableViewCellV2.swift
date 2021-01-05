//
//  ColorTableViewCellV2.swift
//  exercise4
//
//  Created by Scores_Main_User on 1/5/21.
//

import UIKit

class ColorTableViewCellV2: UITableViewCell
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with data:Color)
    {
        self.nameLabel.text = data.name
        self.rgbLabel.text =  data.RGB
        self.hexLabel.text = data.Hex
        contentView.backgroundColor = UIColor(hex: "\(data.Hex)FF")
    }
    
}

extension UIColor
{
    public convenience init?(hex: String)
    {
        let r:CGFloat
        let g:CGFloat
        let b:CGFloat
        let a:CGFloat
        
        if hex.hasPrefix("#")
        {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8
            {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber)
                {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
