//
//  RootRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOut: ViewableRouting?

    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        loggedOutBuilder: LoggedOutBuildable
    ) {
        self.loggedOutBuilder = loggedOutBuilder

        super.init(interactor: interactor, viewController: viewController)

        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut

        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
}
