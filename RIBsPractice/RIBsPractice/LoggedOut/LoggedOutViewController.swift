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
    func login(player1Name: String?, player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    @IBOutlet private weak var player1NameTextField: UITextField!
    @IBOutlet private weak var player2NameTextField: UITextField!

    weak var listener: LoggedOutPresentableListener?
}

// MARK: IBActions
private extension LoggedOutViewController {

    @IBAction func didTapLoginButton(_ sender: UIButton) {
        listener?.login(
            player1Name: player1NameTextField.text,
            player2Name: player2NameTextField.text
        )
    }

}
