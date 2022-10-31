//
//  DetayRouter.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.yemekDetayPresenterNesnesi = DetayPresenter()
        ref.yemekDetayPresenterNesnesi?.detayInteractor = DetayInteractor()
        
    }
}
