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

    func announce(winner: PlayerType?, with completionHandler: @escaping () -> ())
}

protocol TicTacToeListener: class {
    func gameDidEnd()
}

final class TicTacToeInteractor: PresentableInteractor<TicTacToePresentable>, TicTacToeInteractable {

    weak var router: TicTacToeRouting?
    weak var listener: TicTacToeListener?

    override init(presenter: TicTacToePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

}

// MARK: TicTacToePresentableListener
extension TicTacToeInteractor: TicTacToePresentableListener {

    func placeCurrentPlayerMark(at row: Int, col: Int) {
        // 실제 게임 화면은 구현하지 않았기 때문에 무작위의 PlayerType을 사용.
        let winner = setWinner()
        listener?.gameDidEnd(with: winner)
    }

}

// MARK: Private
private extension TicTacToeInteractor {

    func setWinner() -> PlayerType? {
        let playerTypes: [PlayerType] = [.player1, .player2]
        return playerTypes.randomElement()
    }

}
