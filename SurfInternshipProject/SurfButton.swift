//
//  SurfButton.swift
//  SurfInternshipProject
//
//  Created by Mila B on 11.02.2023.
//

import UIKit

class SurfButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(title: String) {
        self.init(frame: .zero)
        set(title: title)
    }
    
    
    private func configure() {
        configuration               = .filled()
        configuration?.cornerStyle  = .medium
        translatesAutoresizingMaskIntoConstraints = false // use auto layout
    }
    
    
    func set(title: String) {
        configuration?.baseBackgroundColor = .black
        configuration?.baseForegroundColor = .white
        configuration?.title = title
    }

}
