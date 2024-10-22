//
//  OffGameBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol OffGameDependency: Dependency {
    var player1: Player { get }
    var player2: Player { get }
    var scoreStream: ScoreStream { get }
}

final class OffGameComponent: Component<OffGameDependency> {

    fileprivate var player1: Player {
        dependency.player1
    }

    fileprivate var player2: Player {
        dependency.player2
    }

    fileprivate var scoreStream: ScoreStream {
        dependency.scoreStream
    }

}

// MARK: - Builder
protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener) -> OffGameRouting
}

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {

    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OffGameListener) -> OffGameRouting {
        let component = OffGameComponent(dependency: dependency)

        let vcName = "OffGameViewController"
        let viewController = UIStoryboard(
            name: vcName,
            bundle: nil
        ).instantiateViewController(
            withIdentifier: vcName
        ) as! OffGameViewController // 실제 프로젝트에서는 Optional 처리를 꼭 해주세요 🙏💦

        viewController.player1Name = component.player1.name
        viewController.player2Name = component.player2.name

        let interactor = OffGameInteractor(
            presenter: viewController,
            scoreStream: component.scoreStream
        )
        interactor.listener = listener

        return OffGameRouter(interactor: interactor, viewController: viewController)
    }

}
