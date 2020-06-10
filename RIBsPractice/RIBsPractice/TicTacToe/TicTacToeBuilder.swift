//
//  TicTacToeBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/11.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol TicTacToeDependency: Dependency {}

final class TicTacToeComponent: Component<TicTacToeDependency> {}

// MARK: - Builder
protocol TicTacToeBuildable: Buildable {
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting
}

final class TicTacToeBuilder: Builder<TicTacToeDependency>, TicTacToeBuildable {

    override init(dependency: TicTacToeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting {
        _ = TicTacToeComponent(dependency: dependency)
        let viewController = TicTacToeViewController()
        let interactor = TicTacToeInteractor(presenter: viewController)
        interactor.listener = listener
        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }

}
