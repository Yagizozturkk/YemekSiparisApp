//
//  DetayProcotol.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation
protocol ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol? {get set}
    var detayView : PresenterToViewDetayProtocol? {get set}

    func sepeteEkle(kullanici_adi:String, yemek_siparis_adet: String, yemek_resim_adi:String, yemek_adi:String, yemek_fiyat:String)
}

protocol PresenterToInteractorDetayProtocol {
    var detayPresenter: InteractorToPresenterDetayProtocol? {get set}
    
    func sepeteYemekEkle(kullanici_adi:String, yemek_siparis_adet: String, yemek_resim_adi:String, yemek_adi:String, yemek_fiyat:String)
}

protocol InteractorToPresenterDetayProtocol {
    func presenteraVeriGonder()
}

protocol PresenterToViewDetayProtocol {
    
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}
