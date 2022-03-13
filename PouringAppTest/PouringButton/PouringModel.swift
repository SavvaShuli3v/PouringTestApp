//
//  PouringModel.swift
//  PouringAppTest
//
//  Created by Савва Шулятьев on 12.03.2022.
//

import UIKit

struct PouringModel {
    let title: String
    let image: UIImage?
}

enum PouringState {
    case topLeft
    case topRight
    case top
    case bottom
}
