//
//  RootRouter.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    private let loggedInBuilder: LoggedInBuildable
    private var loggedIn: Routing?

    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOut: ViewableRouting?

    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        loggedInBuilder: LoggedInBuildable,
        loggedOutBuilder: LoggedOutBuildable
    ) {
        self.loggedInBuilder = loggedInBuilder
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


// MARK: RootRouting
extension RootRouter: RootRouting {

    func routeToLoggedIn(player1Name: String, player2Name: String) {
        if let loggedOut = loggedOut {
            detachChild(loggedOut)
            viewController.dismiss(viewController: loggedOut.viewControllable)
            
            self.loggedOut = nil
        }

        self.loggedIn = loggedInBuilder.build(
            withListener: interactor,
            player1Name: player1Name,
            player2Name: player2Name
        )

        attachChild(loggedIn!)
    }

}
