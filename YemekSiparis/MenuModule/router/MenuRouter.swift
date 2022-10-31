//
//  MenuRouter.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

class MenuRouter : PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuVC) {
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        
        ref.menuPresenterNesnesi = presenter
        ref.menuPresenterNesnesi?.menuInteractor = interactor
        ref.menuPresenterNesnesi?.menuView = ref
        ref.menuPresenterNesnesi?.menuInteractor?.menuPresenter = presenter
    }
}
