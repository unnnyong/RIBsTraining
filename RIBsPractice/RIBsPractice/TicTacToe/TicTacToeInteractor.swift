//
//  TicTacToeInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/11.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol TicTacToeRouting: ViewableRouting {}

protocol TicTacToePresentable: Presentable {
    var listener: TicTacToePresentableListener? { get set }

    func announce(winner: Player?, with completionHandler: @escaping () -> ())
}

protocol TicTacToeListener: class {
    func gameDidEnd(with winner: Player?)
}

final class TicTacToeInteractor: PresentableInteractor<TicTacToePresentable>, TicTacToeInteractable {

    weak var router: TicTacToeRouting?
    weak var listener: TicTacToeListener?

    let player1: Player
    let player2: Player

    init(
        presenter: TicTacToePresentable,
        player1: Player,
        player2: Player
    ) {
        self.player1 = player1
        self.player2 = player2

        super.init(presenter: presenter)

        presenter.listener = self
    }

}

// MARK: TicTacToePresentableListener
extension TicTacToeInteractor: TicTacToePresentableListener {

    func placeCurrentPlayerMark(at row: Int, col: Int) {
        // 실제 게임 화면은 구현하지 않았기 때문에 무작위의 PlayerType을 사용.
        let winner = setWinner()
        presenter.announce(winner: winner) { [weak self] in
            self?.listener?.gameDidEnd(with: winner)
        }
    }

}

// MARK: Private
private extension TicTacToeInteractor {

    func setWinner() -> Player? {
        [player1, player2, nil].randomElement() ?? nil
    }

}
