//
//  PouringButton.swift
//  PouringAppTest
//
//  Created by Савва Шулятьев on 12.03.2022.
//

import UIKit

final class PouringButton: UIView {
    private lazy var topView = PouringTopView()
    private lazy var contentView = PouringContentView()
    private lazy var topMaskView = UIView()
    
    private(set) var isActive = false
    private(set) var pouringState: PouringState = .topLeft
    var duration = 6.0
    
    private var size = CGSize(width: 0, height: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupMainRecognizer()
        setupTopMaskView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: PouringModel) {
        contentView.configure(with: model)
        topView.configure(with: model)
    }
    
    func changePouringState(_ state: PouringState) {
        pouringState = state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        size = bounds.size
        contentView.frame = bounds
        topView.frame = bounds
        if !isActive {
            topMaskView.frame = selectStartMaskFrame(pouringState: pouringState)
        }
    }
    
    private func setupMainRecognizer() {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(handlePressGesture))
        addGestureRecognizer(recognizer)
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 0.967, green: 0.971, blue: 0.979, alpha: 1)
        clipsToBounds = true
        addSubview(contentView)
        addSubview(topView)
    }
    
    @objc private func handlePressGesture() {
        switch isActive {
        case true:
            let newStartFrame = selectStartMaskFrame(pouringState: pouringState)
            UIView.animate(withDuration: duration) { [weak self] in
                self?.topMaskView.layer.cornerRadius = 15
                self?.topMaskView.frame = newStartFrame
            }
        case false:
            let newMaskFrame = setupMaskFrame(size: size, pouringState: pouringState)
            UIView.animate(withDuration: duration) { [weak self] in
                self?.topMaskView.layer.cornerRadius = newMaskFrame.width / 2
                self?.topMaskView.frame = newMaskFrame
            }
        }
        
       isActive = !isActive
    }
}

extension PouringButton {
    private func setupTopMaskView() {
        topMaskView.frame = selectStartMaskFrame(pouringState: pouringState)
        topMaskView.backgroundColor = .black
        topMaskView.layer.cornerRadius = 15
        topView.mask = topMaskView
    }
    
    func selectStartMaskFrame(pouringState: PouringState) -> CGRect {
        switch pouringState {
        case .topLeft:
            return CGRect(x: -30, y: -15, width: 30, height: 30)
        case .topRight:
            return CGRect(x: size.width + 30, y: -15, width: 30, height: 30)
        case .top:
            return CGRect(x: size.width / 2 - 15, y: -50, width: 30, height: 30)
        case .bottom:
            return CGRect(x: size.width / 2 - 15, y: size.height + 50, width: 30, height: 30)
        }
    }
    
    func setupMaskFrame(size: CGSize, pouringState: PouringState) -> CGRect {
        func selectLargerWidth(size: CGSize) -> CGFloat {
            if size.width > size.height {
                return size.width
            } else {
                return size.height
            }
        }
        
        func selectSquareSize(size: CGSize) -> CGSize {
            let newWidth = selectLargerWidth(size: size) * 2.5
            return CGSize(width: newWidth, height: newWidth)
        }
        
        let newSize = selectSquareSize(size: size)
        let largerWidth = selectLargerWidth(size: size)
        
        switch pouringState {
        case .topLeft:
            return CGRect(
                origin: CGPoint(x: -largerWidth, y: -largerWidth),
                size: newSize
            )
        case .topRight:
            return CGRect(
                origin: CGPoint(x: -largerWidth, y: -largerWidth),
                size: newSize
            )
        case .top:
            return CGRect(
                origin: CGPoint(x: -((newSize.width / 2) - (size.width / 2)), y: -((newSize.height / 2) - (size.width / 2))),
                size: newSize
            )
        case .bottom:
            return CGRect(
                origin: CGPoint(x: -((newSize.width / 2) - (size.width / 2)), y: -((newSize.height / 2) - (size.width / 2))),
                size: newSize
            )
        }
    }
}
