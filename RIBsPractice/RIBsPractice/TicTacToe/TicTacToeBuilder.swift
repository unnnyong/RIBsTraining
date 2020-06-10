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

        let vcName = "TicTacToeViewController"
        let viewController = UIStoryboard(name: vcName, bundle: nil)
            .instantiateViewController(withIdentifier: vcName) as! TicTacToeViewController // 실제 프로젝트에서는 Optional 처리를 꼭 해주세요 🙏💦

        let interactor = TicTacToeInteractor(presenter: viewController)
        interactor.listener = listener

        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }

}
