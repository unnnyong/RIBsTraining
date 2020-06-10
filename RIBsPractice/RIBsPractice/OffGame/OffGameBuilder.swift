//
//  OffGameBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol OffGameDependency: Dependency {}

final class OffGameComponent: Component<OffGameDependency> {}

// MARK: - Builder
protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener) -> OffGameRouting
}

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {

    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OffGameListener) -> OffGameRouting {
        _ = OffGameComponent(dependency: dependency)
        let viewController = OffGameViewController()
        let interactor = OffGameInteractor(presenter: viewController)
        interactor.listener = listener

        return OffGameRouter(interactor: interactor, viewController: viewController)
    }
}
