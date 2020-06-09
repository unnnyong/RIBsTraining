//
//  LoggedOutBuilder.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/08.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs

protocol LoggedOutDependency: Dependency {}

final class LoggedOutComponent: Component<LoggedOutDependency> {}

// MARK: - Builder
protocol LoggedOutBuildable: Buildable {
    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting
}

final class LoggedOutBuilder: Builder<LoggedOutDependency> {

    override init(dependency: LoggedOutDependency) {
        super.init(dependency: dependency)
    }

}

// MARK: LoggedOutBuildable
extension LoggedOutBuilder: LoggedOutBuildable {

    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
        _ = LoggedOutComponent(dependency: dependency)

        let vcName = "LoggedOutViewController"
        let vc = UIStoryboard(
            name: vcName,
            bundle: nil
        ).instantiateViewController(
            withIdentifier: vcName
        ) as! LoggedOutViewController // 실제 프로젝트에서는 Optional 처리를 꼭 해주세요 🙏💦

        let interactor = LoggedOutInteractor(presenter: vc)
        interactor.listener = listener

        return LoggedOutRouter(interactor: interactor, viewController: vc)
    }

}
