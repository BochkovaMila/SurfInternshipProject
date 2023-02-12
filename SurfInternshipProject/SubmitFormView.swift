//
//  SubmitFormView.swift
//  SurfInternshipProject
//
//  Created by Mila B on 11.02.2023.
//

import UIKit


protocol ShowAlertDelegate {
    
    func presentSurfAlert(title: String, message: String, buttonTitle: String)
}

class SubmitFormView: UIView {
    
    var delegate: ShowAlertDelegate?
    
    let titleLabel = SurfBodyLabel(text: TextLabels.bodyButton, textAlignment: .left, fontSize: 14)
    let submitButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func configure() {
        addSubview(titleLabel)
        addSubview(submitButton)
        
        submitButton.setTitle(CellLabels.Send, for: .normal)
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        submitButton.configuration = .filled()
        submitButton.configuration?.baseBackgroundColor = .black
        submitButton.configuration?.baseForegroundColor = .white
        submitButton.configuration?.cornerStyle = .capsule

        submitButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            submitButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: submitButton.leadingAnchor, constant: -padding),
            titleLabel.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor)
        ])
    }
    
    @objc func showAlert() {
        delegate?.presentSurfAlert(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", buttonTitle: "Закрыть")
    }
}
