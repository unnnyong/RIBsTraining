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

    @IBOutlet private weak var player1NameLabel: UILabel!
    @IBOutlet private weak var player2NameLabel: UILabel!

    weak var listener: OffGamePresentableListener?

    var player1Name: String!
    var player2Name: String!

    private var score: Score?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
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

// MARK: Private
private extension OffGameViewController {

    func setupViews() {
        player1NameLabel.text = "\(player1Name!)(\(score?.player1Score ?? 0))"
        player2NameLabel.text = "\(player2Name!)(\(score?.player2Score ?? 0))"
    }

}
