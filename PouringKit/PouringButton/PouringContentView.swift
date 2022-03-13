//
//  PouringContentView.swift
//  PouringKit
//
//  Created by Савва Шулятьев on 13.03.2022.
//

import UIKit

final class PouringContentView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var imageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: PouringModel) {
        layoutTitleLabel()
        layoutImageView()
        titleLabel.text = model.title
        imageView.image = model.image
    }
    
    func setTitleColor(_ color: UIColor) {
        titleLabel.textColor = color
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerY()
        titleLabel.leading(50)
    }
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerY()
        imageView.leading(12)
        imageView.height(32)
        imageView.width(32)
    }
}

private func makeTitleLabel() -> UILabel {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .medium)
    label.textColor = .black
    return label
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = .clear
    return imageView
}

