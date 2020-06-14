//
//  TicTacToeBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/11.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol TicTacToeDependency: Dependency {
    var player1: Player { get }
    var player2: Player { get }
}

final class TicTacToeComponent: Component<TicTacToeDependency> {

    fileprivate var player1: Player {
        dependency.player1
    }

    fileprivate var player2: Player {
        dependency.player2
    }

}

// MARK: - Builder
protocol TicTacToeBuildable: Buildable {
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting
}

final class TicTacToeBuilder: Builder<TicTacToeDependency>, TicTacToeBuildable {

    override init(dependency: TicTacToeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting {
        let component = TicTacToeComponent(dependency: dependency)

        let vcName = "TicTacToeViewController"
        let viewController = UIStoryboard(name: vcName, bundle: nil)
            .instantiateViewController(withIdentifier: vcName) as! TicTacToeViewController // 실제 프로젝트에서는 Optional 처리를 꼭 해주세요 🙏💦

        let interactor = TicTacToeInteractor(
            presenter: viewController,
            player1: component.player1,
            player2: component.player2
        )
        interactor.listener = listener

        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }

}
