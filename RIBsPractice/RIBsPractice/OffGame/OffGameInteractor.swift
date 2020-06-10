//
//  OffGameInteractor.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift

protocol OffGameRouting: ViewableRouting {}

protocol OffGamePresentable: Presentable {
    var listener: OffGamePresentableListener? { get set }
}

protocol OffGameListener: class {}

final class OffGameInteractor: PresentableInteractor<OffGamePresentable>, OffGameInteractable, OffGamePresentableListener {

    weak var router: OffGameRouting?
    weak var listener: OffGameListener?

    override init(presenter: OffGamePresentable) {
        super.init(presenter: presenter)

        presenter.listener = self
    }

}
