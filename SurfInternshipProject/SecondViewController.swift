//
//  SecondViewController.swift
//  SurfInternshipProject
//
//  Created by Mila B on 11.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    let submitFormView = SubmitFormView()
    let titleLabel = SurfTitleLabel(textAlignment: .left, fontSize: 26)
    let subtitleLabelOne = SurfBodyLabel(text: TextLabels.bodyWork, textAlignment: .left, fontSize: 14)
    let subtitleLabelTwo = SurfBodyLabel(text: TextLabels.bodyGet, textAlignment: .left, fontSize: 14)
    
    var professions: [SurfBodyLabel] = []
    
    private let horizontalCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    private let verticalCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        populateProfessions()
        configureViews()
        configureCollectionViews()
        horizontalCollectionView.reloadData()
        verticalCollectionView.reloadData()
    }
    
    
    private func configureViews() {
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        submitFormView.translatesAutoresizingMaskIntoConstraints = false
        submitFormView.delegate = self
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabelOne)
        view.addSubview(horizontalCollectionView)
        view.addSubview(subtitleLabelTwo)
        view.addSubview(verticalCollectionView)
        view.addSubview(submitFormView)
        
        let padding: CGFloat = 15
        
        titleLabel.text = TextLabels.header
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            subtitleLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            subtitleLabelOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            subtitleLabelOne.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            
            horizontalCollectionView.topAnchor.constraint(equalTo: subtitleLabelOne.bottomAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 80),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            subtitleLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            subtitleLabelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            subtitleLabelTwo.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor),
            subtitleLabelTwo.bottomAnchor.constraint(equalTo: subtitleLabelTwo.topAnchor, constant: 50),
            
            verticalCollectionView.topAnchor.constraint(equalTo: subtitleLabelTwo.bottomAnchor, constant: padding),
            verticalCollectionView.bottomAnchor.constraint(equalTo: verticalCollectionView.topAnchor, constant: 120),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            submitFormView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            submitFormView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            submitFormView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            submitFormView.heightAnchor.constraint(equalToConstant: 85),
        ])
    }
    
    private func configureCollectionViews() {
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        horizontalCollectionView.register(SurfCell.self, forCellWithReuseIdentifier: SurfCell.identifier)
        
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.register(SurfCell.self, forCellWithReuseIdentifier: SurfCell.identifier)
    }
    
    private func populateProfessions() {
        professions = [CellLabels.iOS, CellLabels.Android, CellLabels.Design, CellLabels.QA, CellLabels.Flutter, CellLabels.PM, CellLabels.Java, CellLabels.JavaScript, CellLabels.HTML, CellLabels.CSS]
    }
    
}


extension SecondViewController: ShowAlertDelegate {
    
    func presentSurfAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = SurfAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overFullScreen
        self.present(alertVC, animated: true)
    }
}


extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return professions.count > 10 ? 10 : professions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurfCell.identifier, for: indexPath) as? SurfCell {
            let profession = professions[indexPath.row]
            cell.setUp(with: profession.text ?? "Default")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = professions[indexPath.row].text ?? "Default"
        let width = item.size(withAttributes: [NSAttributedString.Key.font : professions[indexPath.row].font]).width + 50
        return CGSize(width: width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = collectionView.cellForItem(at: indexPath) as? SurfCell {
            item.didSelect()
            collectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
        }
        collectionView.reloadData()
    }
    
}
