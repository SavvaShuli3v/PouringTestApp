//
//  PouringTopView.swift
//  PouringKit
//
//  Created by Савва Шулятьев on 13.03.2022.
//

import UIKit

final class PouringTopView: UIView {
    private lazy var contentView = PouringContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        addSubview(contentView)
    }
    
    func configure(with model: PouringModel) {
        contentView.setTitleColor(.white)
        contentView.configure(with: model)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
}
