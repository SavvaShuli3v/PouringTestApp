//
//  PouringModel.swift
//  PouringKit
//
//  Created by Савва Шулятьев on 13.03.2022.
//

import UIKit

public struct PouringModel {
    let title: String
    let image: UIImage?
    
    public init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
    }
}

public enum PouringState {
    case topLeft
    case topRight
    case top
    case bottom
}

