//
//  MainItem.swift
//  AdmiralCheckControlViewer
//
//  Created by ADyatkov on 15.09.2023.
//

import Foundation

enum MainItem: Hashable {
    case checkBox
    case radioButton

    var imageName: String {
        switch self {
        case .checkBox:
            return "Checkboxes"
        case .radioButton:
            return "Radiobuttons"
        }
    }

    var title: String {
        switch self {
        case .checkBox:
            return "Checkbox"
        case .radioButton:
            return "Radiobutton"
        }
    }

    var subtitle: String {
        switch self {
        case .checkBox:
            return "Селектор"
        case .radioButton:
            return "Радио кнопка"
        }
    }

    var id: UUID {
        return UUID()
    }
}
