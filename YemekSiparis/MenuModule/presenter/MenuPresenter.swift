//
//  MenuPresenter.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

class MenuPresenter : ViewToPresenterMenuProtocol {

    var menuInteractor: PresenterToInteractorMenuProtocol?
    var menuView: PresenterToViewMenuProtocol?
    
    func yemekleriGetir() {
        menuInteractor?.tumYemekleriGetir()
    }
}

extension MenuPresenter: InteractorToPresenterMenuProtocol {
    func presenteraVeriGonder(yemekListesi: [Yemekler]) {
        menuView?.vieweVeriGonder(yemekListesi: yemekListesi)
    }
}
