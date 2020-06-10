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
    func present(to viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

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

        viewController.present(to: offGame.viewControllable)
    }
}
