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

final class OffGameViewController: UIViewController, OffGameViewControllable {

    @IBOutlet private weak var playerNameLabel: UILabel!

    weak var listener: OffGamePresentableListener?

    var player1Name: String!
    var player2Name: String!

    private var score: Score?

    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLabel.text = "\(player1Name!) vs \(player2Name!)"
    }

}

// MARK: OffGamePresentable
extension OffGameViewController: OffGamePresentable {

    func set(score: Score) {
        self.score = score
    }

}

// MARK: IBAction
private extension OffGameViewController {

    @IBAction func didStartButton(_ sender: UIButton) {
        listener?.startGame()
    }

}
