//
//  LoggedOutInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/08.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
}

protocol LoggedOutListener: class {
    func didLogin(player1Name: String, player2Name: String)
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)

        presenter.listener = self
    }
}

// MARK: LoggedOutPresentableListener
extension LoggedOutInteractor: LoggedOutPresentableListener {

    func login(player1Name: String?, player2Name: String?) {
        let player1Name = player1Name ?? "Default"
        let player2Name = player2Name ?? "Default"

        listener?.didLogin(player1Name: player1Name, player2Name: player2Name)
    }

}
