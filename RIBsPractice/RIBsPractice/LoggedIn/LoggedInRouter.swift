//
//  LoggedInRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener {
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

    init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable,
        offGameBuilder: OffGameBuildable
    ) {
        self.viewController = viewController
        self.offGameBuilder = offGameBuilder

        super.init(interactor: interactor)

        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        let offGame = offGameBuilder.build(withListener: interactor)
        self.offGame = offGame
        currentChild = offGame

        attachChild(offGame)

        viewController.present(viewController: offGame.viewControllable)
    }

}

// MARK: LoggedInRouting
extension LoggedInRouter: LoggedInRouting {

    func routeToTicTacToe() {
        if let offGame = offGame {
            detachChild(offGame)
            viewController.dismiss(viewController: offGame.viewControllable)

            self.currentChild = nil
        }
    }

}
