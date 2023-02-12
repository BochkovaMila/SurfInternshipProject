//
//  SurfCell.swift
//  SurfInternshipProject
//
//  Created by Mila B on 11.02.2023.
//

import UIKit

final class SurfCell: UICollectionViewCell {
    
    static let identifier = "SurfCellIdentifier"
    
    let profession = SurfBodyLabel(frame: .zero)
    
    var isCellSelected: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = isCellSelected ? .black : .systemGray6
        profession.textColor = isCellSelected ? .white : .black
    }
    
    private func configureView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 10
        contentView.addSubview(profession)
    }
    
    private func configureLayout() {
        profession.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profession.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profession.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profession.topAnchor.constraint(equalTo: contentView.topAnchor),
            profession.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUp(with text: String) {
        profession.text = text
        profession.textColor = .black
        profession.textAlignment = .center
    }
    
    func didSelect() {
        isCellSelected = !isCellSelected
        if isCellSelected {
            contentView.backgroundColor = .black
            profession.textColor = .white
        } else {
            contentView.backgroundColor = .systemGray6
            profession.textColor = .black
        }
    }
    
    func didDeselect() {
        contentView.backgroundColor = .systemGray6
        profession.textColor = .black
    }
    
}
