//
//  LoggedOutInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/08.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: LoggedOutPresentableListener
extension LoggedOutInteractor: LoggedOutPresentableListener {

    func login(player1Name: String?, player2Name: String?) {
        let player1Name = player1Name ?? "Default"
        let player2Name = player2Name ?? "Default"

        print("🙅‍♂️")

        print("첫 번째 선수 이름: \(player1Name), 두 번째 선수 이름: \(player2Name)")
    }

}
