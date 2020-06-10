//
//  LoggedOutRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/08.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {

    override init(
        interactor: LoggedOutInteractable,
        viewController: LoggedOutViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)

        interactor.router = self
    }
}
