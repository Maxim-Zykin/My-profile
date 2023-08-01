//
//  HomeViewController.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var profilePhotoImage: UIImageView!
    @IBOutlet weak var nameLastLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var aboutYourselfLabel: UILabel!
    
    private var viewModel: HomeViewModel! {
        didSet{
            profilePhotoImage.image = UIImage(named: "my_photo")
            nameLastLabel.text = viewModel.name
            infoLabel.text = viewModel.title
            cityLabel.text = viewModel.city
            aboutYourselfLabel.text = viewModel.aboutYourselfLabel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
    }
}

extension HomeViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}
