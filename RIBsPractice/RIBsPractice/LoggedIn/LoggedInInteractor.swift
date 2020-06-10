//
//  LoggedInInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: ViewableRouting {}

protocol LoggedInPresentable: Presentable {
    var listener: LoggedInPresentableListener? { get set }
}

protocol LoggedInListener: class {}

final class LoggedInInteractor: PresentableInteractor<LoggedInPresentable>, LoggedInInteractable, LoggedInPresentableListener {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    override init(presenter: LoggedInPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

}
