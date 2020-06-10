//
//  LoggedInRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener, TicTacToeListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable> {

    private let viewController: LoggedInViewControllable

    private var currentChild: ViewableRouting?

    private let offGameBuilder: OffGameBuildable
    private var offGame: OffGameRouting?

    private let ticTacToeBuilder: TicTacToeBuildable
    private var ticTacToe: TicTacToeRouting?

    init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable,
        offGameBuilder: OffGameBuildable,
        ticTacToeBuilder: TicTacToeBuildable
    ) {
        self.viewController = viewController

        self.offGameBuilder = offGameBuilder
        self.ticTacToeBuilder = ticTacToeBuilder

        super.init(interactor: interactor)

        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        attachOffGame()
    }

    func cleanupViews() {
        guard let currentChild = currentChild else { return }

        viewController.dismiss(viewController: currentChild.viewControllable)
    }

}

// MARK: LoggedInRouting
extension LoggedInRouter: LoggedInRouting {

    func routeToTicTacToe() {
        detachCurrentChild()

        let ticTacToe = ticTacToeBuilder.build(withListener: interactor)
        self.ticTacToe = ticTacToe
        currentChild = ticTacToe

        attachChild(ticTacToe)

        viewController.present(viewController: ticTacToe.viewControllable)
    }

    func routeToOffGame() {
        detachCurrentChild()
        attachOffGame()
    }

}

// MARK: Private Method
private extension LoggedInRouter {

    func attachOffGame() {
        let offGame = offGameBuilder.build(withListener: interactor)
        self.offGame = offGame
        currentChild = offGame

        attachChild(offGame)

        viewController.present(viewController: offGame.viewControllable)
    }

    func detachCurrentChild() {
        guard let currentChild = currentChild else { return }

        detachChild(currentChild)
        viewController.dismiss(viewController: currentChild.viewControllable)

        self.currentChild = nil
    }

}
