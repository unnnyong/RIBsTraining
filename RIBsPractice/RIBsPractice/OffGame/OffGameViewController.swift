//
//  OffGameViewController.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/10.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: class {
    func startGame()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?

}

// MARK: IBAction
private extension OffGameViewController {

    @IBAction func didStartButton(_ sender: UIButton) {
        listener?.startGame()
    }

}
