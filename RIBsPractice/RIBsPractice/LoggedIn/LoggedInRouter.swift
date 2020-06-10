//
//  LoggedInRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    private let viewController: LoggedInViewControllable

    init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable
    ) {
        self.viewController = viewController

        super.init(interactor: interactor)

        interactor.router = self
    }
}
