//
//  RootBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {}

final class RootComponent: Component<RootDependency> {}
extension RootComponent: LoggedOutDependency {}

// MARK: - Builder
protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency> {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

}

// MARK: RootBuildable
extension RootBuilder: RootBuildable {

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)

        let loggedOutBuilder = LoggedOutBuilder(dependency: component)

        return RootRouter(
            interactor: interactor,
            viewController: viewController,
            loggedOutBuilder: loggedOutBuilder
        )
    }

}
