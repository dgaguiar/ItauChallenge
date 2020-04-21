//
//  View.swift
//  ItauChallenge
//
//  Created by daianne.gomes.aguiar on 20/04/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation
import UIKit

class View: UIView {
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "open-menu"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }()
    
    private lazy var seachButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "open-menu"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "more"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "my balance"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.heightAnchor.constraint(equalToConstant: 18).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 999,00"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        return label
    }()
    
    private lazy var textHeaderStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.valueLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    public lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.menuButton, self.textHeaderStackView, self.seachButton, self.moreButton])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isAccessibilityElement = true
        return stackView
    }()
    
    public override func prepareForInterfaceBuilder() {
          super.prepareForInterfaceBuilder()
          setup()
      }
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.addSubview(self.headerStackView)
        headerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        headerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        headerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        headerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
}
