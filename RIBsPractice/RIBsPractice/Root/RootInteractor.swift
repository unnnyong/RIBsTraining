//
//  RootInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func routeToLoggedIn(player1Name: String, player2Name: String)
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: class {}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)

        presenter.listener = self
    }

}

// MARK: RootInteractable
extension RootInteractor: RootInteractable {

    func didLogin(player1Name: String, player2Name: String) {
        router?.routeToLoggedIn(player1Name: player1Name, player2Name: player2Name)
    }

}
