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

final class LoggedInRouter: ViewableRouter<LoggedInInteractable, LoggedInViewControllable>, LoggedInRouting {

    override init(
        interactor: LoggedInInteractable,
        viewController: LoggedInViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)

        interactor.router = self
    }
}
