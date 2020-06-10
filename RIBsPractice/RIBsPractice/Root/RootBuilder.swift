//
//  RootBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {}

// MARK: Component
final class RootComponent: Component<RootDependency> {

    let rootViewController: RootViewController

    init(
        dependency: RootDependency,
        rootViewController: RootViewController
    ) {
        self.rootViewController = rootViewController

        super.init(dependency: dependency)
    }

}

extension RootComponent: LoggedOutDependency {}
extension RootComponent: LoggedInDependency {

    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }

}

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
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)

        let loggedInBuilder = LoggedInBuilder(dependency: component)
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)

        return RootRouter(
            interactor: interactor,
            viewController: viewController,
            loggedInBuilder: loggedInBuilder,
            loggedOutBuilder: loggedOutBuilder
        )
    }

}
