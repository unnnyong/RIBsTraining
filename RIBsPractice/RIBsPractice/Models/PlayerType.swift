//
//  PlayerType.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/13.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import UIKit

enum PlayerType: Int {
    case player1 = 1
    case player2

    var color: UIColor {
        switch self {
        case .player1:
            return .red
        case .player2:
            return .blue
        }
    }

    var colorString: String {
        switch self {
        case .player1:
            return "Red"
        case .player2:
            return "Blue"
        }
    }
}
