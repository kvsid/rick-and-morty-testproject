//
//  CustomCell.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 04.04.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            cellView.backgroundColor = UIColor(red: 70/255.0, green: 157/255.0, blue: 193/255.0, alpha: 1)
        } else {
            cellView.backgroundColor = UIColor(red: 45/255.0, green: 179/255.0, blue: 214/255.0, alpha: 1)
        }
    }
    
    func configure(with model: Result) {
        
        cellLabel.text = model.name
    }
}
