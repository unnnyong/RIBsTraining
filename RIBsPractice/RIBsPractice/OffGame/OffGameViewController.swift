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

protocol OffGamePresentableListener: class {}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?
}
