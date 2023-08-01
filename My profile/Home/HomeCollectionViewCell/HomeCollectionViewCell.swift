//
//  HomeCollectionViewCell.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var skillLabel: UILabel!
    
    var viewModel: HomeCollectionViewCellModelProtocol! {
        didSet {
            self.skillLabel.text = viewModel.name
        }
    }
}
