//
//  TicTacToeViewController.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/11.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TicTacToePresentableListener: class {
    func gameDidEnd()
}

final class TicTacToeViewController: UIViewController, TicTacToePresentable, TicTacToeViewControllable {

    weak var listener: TicTacToePresentableListener?

}

// MARK: IBAction
private extension TicTacToeViewController {

    @IBAction func didTapFinishButton(_ sender: UIButton) {
        listener?.gameDidEnd()
    }

}
