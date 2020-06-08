//
//  LoggedOutViewController.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/08.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    @IBOutlet private weak var player1NameTextField: UITextField!
    @IBOutlet private weak var player2NameTextField: UITextField!

    weak var listener: LoggedOutPresentableListener?
}

// MARK: IBActions
private extension LoggedOutViewController {

    @IBAction func didTapLoginButton(_ sender: UIButton) {
    }

}
