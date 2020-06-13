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

    func set(score: Score)
}

protocol OffGameListener: class {
    func startGame()
}

final class OffGameInteractor: PresentableInteractor<OffGamePresentable>, OffGameInteractable {

    weak var router: OffGameRouting?
    weak var listener: OffGameListener?

    private var scoreStream: ScoreStream

    init(
        presenter: OffGamePresentable,
        scoreStream: ScoreStream
    ) {
        self.scoreStream = scoreStream

        super.init(presenter: presenter)

        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        updateScore()
    }

}

// MARK: OffGamePresentableListener
extension OffGameInteractor: OffGamePresentableListener {

    func startGame() {
        listener?.startGame()
    }

}

// MARK: Private
private extension OffGameInteractor {

    func updateScore() {
        scoreStream.score
            .subscribe { [weak self] score in
                guard let strongSelf = self, let scoreElement = score.element else { return }

                strongSelf.presenter.set(score: scoreElement)
            }
            .disposeOnDeactivate(interactor: self)
    }

}
