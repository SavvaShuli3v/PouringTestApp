//
//  BackContentView.swift
//  PouringAppTest
//
//  Created by Савва Шулятьев on 12.03.2022.
//

import UIKit

final class AnimateContentView: UIView {
    private lazy var mainLabel = makeMainLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 0.851, green: 0.157, blue: 0.184, alpha: 1)
        layer.cornerRadius = 16
        layoutMainLabel()
    }
    
    private func layoutMainLabel() {
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.top(40)
        mainLabel.leading(16)
        mainLabel.trailing(-16)
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.text = "Какой транспорт вы предпочитаете?"
    label.numberOfLines = 2
    label.textColor = .white
    label.font = .systemFont(ofSize: 32, weight: .medium)
    return label
}

