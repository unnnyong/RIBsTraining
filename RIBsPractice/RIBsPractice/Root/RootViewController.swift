//
//  RootViewController.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/09.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {}

final class RootViewController: UIViewController, RootPresentable {

    weak var listener: RootPresentableListener?

}

// MARK: RootViewControllable, LoggedInViewControllable
extension RootViewController: RootViewControllable, LoggedInViewControllable {

    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        guard presentedViewController == viewController.uiviewController else { return }

        dismiss(animated: true)
    }

}
