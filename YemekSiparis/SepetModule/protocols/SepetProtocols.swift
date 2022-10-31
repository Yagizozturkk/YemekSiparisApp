//
//  SepetProtocols.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?{get set}
    var sepetView: PresenterToViewSepetProtocol? {get set}
    
    func sepettekiYemekleriGetir(kullanici_adi: String)
    func sepetteYemekSil(sepet_yemek_id: String, kullanici_adi: String)
    func yemekUpdate(yemek:SepetYemekler, yemekMiktari: Int)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol? {get set}
    
    func sepetYemekleriGetir(kullanici_adi: String)
    func sepettenYemekSil(sepet_yemek_id: String, kullanici_adi: String)
    func sepetYemekUpdate(yemek:SepetYemekler, yemekMiktari: Int)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemekListesi: [SepetYemekler])
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi: [SepetYemekler])
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC)
}
