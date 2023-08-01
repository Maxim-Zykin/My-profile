//
//  HomeViewModel.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var name: String { get }
    var title: String { get }
    var city: String { get }
    var aboutYourselfLabel: String { get }
    //var skills: Skills { get set }
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> HomeCollectionViewCellModelProtocol
}

class HomeViewModel: HomeViewModelProtocol {
   
    var name: String {
        "Зыкин Максим Алексеевич"
    }
    
    var title: String {
        "iOS developer"
    }
    
    var city: String {
        "Прокопьевск"
    }
    
    var aboutYourselfLabel: String {
        "Закончил техникум по специальности 'Наладчик аппаратного и программного обеспечения'. В 2021 году заинтересовался iOS разработкой. Сейчас разрабатываю свое приложение с информацией о горнолыжных курортах."
    }
    //var skills: Skills
    
    func numberOfRows() -> Int {
        mySkills.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> HomeCollectionViewCellModelProtocol {
        let skills = mySkills[indexPath.row]
        return HomeCollectionViewCellModel(skills: skills)
    }
    
    
}
