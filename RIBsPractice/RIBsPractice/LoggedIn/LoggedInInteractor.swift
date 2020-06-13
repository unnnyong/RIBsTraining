//
//  LoggedInInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func routeToTicTacToe()
    func routeToOffGame()
}

protocol LoggedInListener: class {}

final class LoggedInInteractor: Interactor {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    private let mutableScoreStream: MutableScoreStream

    init(mutableScoreStream: MutableScoreStream) {
        self.mutableScoreStream = mutableScoreStream
    }

}

// MARK: LoggedInInteractable
extension LoggedInInteractor: LoggedInInteractable {

    func startGame() {
        router?.routeToTicTacToe()
    }

    func gameDidEnd() {
        router?.routeToOffGame()
    }

}
