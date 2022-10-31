//
//  MenuProtocols.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

protocol ViewToPresenterMenuProtocol {
    var menuInteractor : PresenterToInteractorMenuProtocol? {get set}
    var menuView : PresenterToViewMenuProtocol? {get set}
    
    func yemekleriGetir()
}

protocol PresenterToInteractorMenuProtocol {
    var menuPresenter : InteractorToPresenterMenuProtocol? {get set}
    
    func tumYemekleriGetir()
}

protocol InteractorToPresenterMenuProtocol {
    func presenteraVeriGonder(yemekListesi: [Yemekler])
}

protocol PresenterToViewMenuProtocol {
    func vieweVeriGonder(yemekListesi: [Yemekler])
}

protocol PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuVC)
}
