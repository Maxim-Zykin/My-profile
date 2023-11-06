//
//  HomeViewController.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {

    
    @IBOutlet weak var profilePhotoImage: UIImageView! {
        didSet {
            profilePhotoImage.layer.cornerRadius = profilePhotoImage.frame.width / 2
        }
    }
    
    @IBOutlet weak var nameLastLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var aboutYourselfLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var correctSkillsButton: UIButton! {
        didSet {
            correctSkillsButton.setImage(UIImage(named: "correct"), for: .normal)
        }
    }
    
    var correctState = false
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel = HomeViewModel()
    }
    
    @IBAction func addSkill(_ sender: Any) {
        if !correctState {
            correctSkillsButton.setImage(UIImage(named: "done"), for: .normal)
        } else {
            correctSkillsButton.setImage(UIImage(named: "correct"), for: .normal)
        }
        correctState = !correctState
        
            let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Добавить", style: .default) { _ in
                guard let addSkill = alert.textFields?.first?.text, !addSkill.isEmpty else { return }
                let skill = Skills(name: addSkill)
                mySkills.append(skill)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
            alert.addTextField()
            alert.addAction(cancelAction)
            alert.addAction(saveAction)
            present(alert, animated: true)
        }
}

extension HomeViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return correctState ? viewModel.numberOfRows() + 1 : viewModel.numberOfRows()
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

