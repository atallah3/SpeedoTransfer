//
//  BottomSheet.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 05/09/2024.
//

import Foundation
import UIKit

class BottomSheet: UIView {
    
    private let dragHandle: UIView = {
        let handle = UIView()
        handle.backgroundColor = UIColor.darkGray
        handle.layer.cornerRadius = 3
        handle.translatesAutoresizingMaskIntoConstraints = false
        return handle
    }()
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourite List"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        self.addSubview(dragHandle)
        self.addSubview(mainLabel)
    }
    
    func setupViewAttributes() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 40
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([

            dragHandle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            dragHandle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dragHandle.widthAnchor.constraint(equalToConstant: 40),
            dragHandle.heightAnchor.constraint(equalToConstant: 6),
            mainLabel.topAnchor.constraint(equalTo: dragHandle.bottomAnchor, constant: 20),
            mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
