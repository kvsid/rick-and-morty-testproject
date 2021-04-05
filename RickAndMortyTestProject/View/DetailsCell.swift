//
//  DetailsCell.swift
//  RickAndMortyTestProject
//
//  Created by Xenia Sidorova on 05.04.2021.
//
import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var fieldValue: UILabel!
    
    func configure(_ fieldMap: [String: Any]) {
        fieldName.text = fieldMap.keys.first
        fieldValue.text = fieldMap.values.first as? String
    }
}
