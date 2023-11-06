//
//  HomeCollectionViewCellModel.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import Foundation

protocol HomeCollectionViewCellModelProtocol {
    var name: String { get }
    
    init(skills: Skills)
}

class HomeCollectionViewCellModel: HomeCollectionViewCellModelProtocol {
   
    var name: String {
        scills.name
    }
    
    private var scills: Skills
    
    required init(skills: Skills) {
        self.scills = skills
    }
}
