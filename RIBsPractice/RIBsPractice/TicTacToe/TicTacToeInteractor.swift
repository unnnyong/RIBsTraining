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

    func gameDidEnd() {
        listener?.gameDidEnd()
    }

}
