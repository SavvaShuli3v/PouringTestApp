//
//  TestViewController.swift
//  PouringAppTest
//
//  Created by Савва Шулятьев on 11.03.2022.
//

import UIKit
import PouringKit

private let models = [
    PouringModel(
        title: "Метро",
        image: .init(named: "metro")
    ),
    PouringModel(
        title: "Наземный транспорт",
        image: .init(named: "tatobus")
    ),
    PouringModel(
        title: "Такси",
        image: .init(named: "taxi")
    ),
    PouringModel(
        title: "Каршеринг",
        image: .init(named: "carsharing")
    )
]

final class TestViewController: UIViewController {
    private lazy var pouringButton1 = PouringButton()
    private lazy var pouringButton2 = PouringButton()
    private lazy var pouringButton3 = PouringButton()
    private lazy var pouringButton4 = PouringButton()
    
    private lazy var backView = BackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        setupPouringButtons()
    }
    
    private func setupPouringButtons() {
        pouringButton1.layer.cornerRadius = 16
        
        pouringButton1.configure(with: models[0])
        pouringButton1.changePouringState(.top)
        
        pouringButton2.layer.cornerRadius = 16
        pouringButton2.configure(with: models[1])
        
        pouringButton3.layer.cornerRadius = 16
        pouringButton3.configure(with: models[2])
        pouringButton3.changePouringState(.topRight)
        
        pouringButton4.layer.cornerRadius = 16
        pouringButton4.configure(with: models[3])
        pouringButton4.changePouringState(.bottom)
    }
}

private extension TestViewController {
    func setupInitialState() {
        layoutBackView()
        layoutPouringButtons()
    }
    
    func layoutPouringButtons() {
        view.addSubview(pouringButton1)
        pouringButton1.translatesAutoresizingMaskIntoConstraints = false
        pouringButton1.trailing(-20)
        pouringButton1.top(212)
        pouringButton1.width(114)
        pouringButton1.height(56)
        
        view.addSubview(pouringButton2)
        pouringButton2.translatesAutoresizingMaskIntoConstraints = false
        pouringButton2.trailing(-20)
        pouringButton2.top(8, to: pouringButton1.bottomAnchor)
        pouringButton2.width(248)
        pouringButton2.height(56)
        
        view.addSubview(pouringButton3)
        pouringButton3.translatesAutoresizingMaskIntoConstraints = false
        pouringButton3.trailing(-20)
        pouringButton3.top(8, to: pouringButton2.bottomAnchor)
        pouringButton3.width(107)
        pouringButton3.height(56)
        
        view.addSubview(pouringButton4)
        pouringButton4.translatesAutoresizingMaskIntoConstraints = false
        pouringButton4.trailing(-20)
        pouringButton4.top(8, to: pouringButton3.bottomAnchor)
        pouringButton4.width(152)
        pouringButton4.height(56)
    }
    
    func layoutBackView() {
        view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.allConstraints(to: view)
    }
}

