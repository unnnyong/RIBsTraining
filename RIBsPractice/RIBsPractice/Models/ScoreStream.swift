//
//  ScoreStream.swift
//  RIBsPractice
//
//  Created by Eunyeong Kim on 2020/06/13.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import RxSwift

struct Score {
    let player1Score: Int
    let player2Score: Int

    static func equals(lhs: Score, rhs: Score) -> Bool {
        lhs.player1Score == rhs.player1Score
            && lhs.player2Score == rhs.player2Score
    }
}

protocol ScoreStream {
    var score: Observable<Score> { get }
}

protocol MutableScoreStream: ScoreStream {
    func updateScore(with winner: PlayerType)
}

final class ScoreStreamImpl: MutableScoreStream {

    private let variable = Variable<Score>(Score(player1Score: 0, player2Score: 0))

    var score: Observable<Score> {
        variable.asObservable().distinctUntilChanged { lhs, rhs -> Bool in
            Score.equals(lhs: lhs, rhs: rhs)
        }
    }

    func updateScore(with winner: PlayerType) {
        let newScore: Score = {
            let currentScore = variable.value

            switch winner {
            case .player1:
                return Score(player1Score: currentScore.player1Score + 1, player2Score: currentScore.player2Score)
            case .player2:
                return Score(player1Score: currentScore.player1Score, player2Score: currentScore.player2Score + 1)
            }
        }()

        variable.value = newScore
    }

}
