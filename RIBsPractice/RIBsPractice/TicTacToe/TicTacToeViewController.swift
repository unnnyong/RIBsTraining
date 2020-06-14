//
//  TicTacToeViewController.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/11.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TicTacToePresentableListener: class {
    func placeCurrentPlayerMark(at row: Int, col: Int)
}

final class TicTacToeViewController: UIViewController, TicTacToeViewControllable {

    weak var listener: TicTacToePresentableListener?

}

// MARK: TicTacToePresentable
extension TicTacToeViewController: TicTacToePresentable {

    func announce(winner: Player?, with completionHandler: @escaping () -> ()) {
        let winnerString: String
        let alertTitleColor: UIColor

        if let winner = winner {
            winnerString = "\(winner.name) won!"
            alertTitleColor = winner.type.color
        } else {
            winnerString = "It's a draw!"
            alertTitleColor = .black
        }

        let alert = UIAlertController(
            title: winnerString,
            message: nil,
            preferredStyle: .alert
        )

        let attributedTitle = NSAttributedString(
            string: winnerString,
            attributes: [NSAttributedString.Key.foregroundColor: alertTitleColor]
        )
        alert.setValue(attributedTitle, forKey: "attributedTitle")

        let closeAction = UIAlertAction(
            title: "Close Game",
            style: .default
        ) { _ in
            completionHandler()
        }

        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }

}

// MARK: IBAction
private extension TicTacToeViewController {

    @IBAction func didTapFinishButton(_ sender: UIButton) {
        // 실제 게임 화면은 구현하지 않았기 때문에 임의의 파라미터 0으로 대입.
        listener?.placeCurrentPlayerMark(at: 0, col: 0)
    }

}
