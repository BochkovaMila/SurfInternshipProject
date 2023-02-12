//
//  ViewController.swift
//  SurfInternshipProject
//
//  Created by Mila B on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        configureBackgroundImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentSecondVC()
    }
    
    private func configureBackgroundImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.backgroundImage
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 850),
            imageView.widthAnchor.constraint(equalToConstant: 850),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
    }
    
    private func presentSecondVC() {
        let rootVC = SecondViewController()
        rootVC.isModalInPresentation = true
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }

}

