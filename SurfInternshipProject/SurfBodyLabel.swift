//
//  SurfBodyLabel.swift
//  SurfInternshipProject
//
//  Created by Mila B on 11.02.2023.
//

import UIKit

class SurfBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        addLineSpacing(for: text)
    }
    
    private func configure() {
        numberOfLines = 0
        sizeToFit()
        textColor = UIColor.systemGray
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addLineSpacing(for text: String) {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }

}
