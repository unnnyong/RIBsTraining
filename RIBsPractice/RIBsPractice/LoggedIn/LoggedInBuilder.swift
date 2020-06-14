//
//  LoggedInBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {

    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

    let player1: Player
    let player2: Player

    var mutableScoreStream: MutableScoreStream {
        shared { ScoreStreamImpl() }
    }

    init(
        dependency: LoggedInDependency,
        player1Name: String,
        player2Name: String
    ) {
        self.player1 = Player(name: player1Name, type: .player1)
        self.player2 = Player(name: player2Name, type: .player2)

        super.init(dependency: dependency)
    }

}

extension LoggedInComponent: OffGameDependency {

    var scoreStream: ScoreStream {
        mutableScoreStream
    }

}

extension LoggedInComponent: TicTacToeDependency {}

// MARK: - Builder
protocol LoggedInBuildable: Buildable {
    func build(
        withListener listener: LoggedInListener,
        player1Name: String,
        player2Name: String
    ) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(
        withListener listener: LoggedInListener,
        player1Name: String,
        player2Name: String
    ) -> LoggedInRouting {
        let component = LoggedInComponent(
            dependency: dependency,
            player1Name: player1Name,
            player2Name: player2Name
        )
        let interactor = LoggedInInteractor(mutableScoreStream: component.mutableScoreStream)
        interactor.listener = listener

        let offGameBuilder = OffGameBuilder(dependency: component)
        let tictacToeBuilder = TicTacToeBuilder(dependency: component)

        return LoggedInRouter(
            interactor: interactor,
            viewController: component.loggedInViewController,
            offGameBuilder: offGameBuilder,
            ticTacToeBuilder: tictacToeBuilder
        )
    }

}
