//
//  SepetPresenter.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    let kullanici_adi : String = "yagizozturk"
    
    func sepettekiYemekleriGetir(kullanici_adi:String) {
        sepetInteractor?.sepetYemekleriGetir(kullanici_adi: self.kullanici_adi)
    }
    func sepetteYemekSil(sepet_yemek_id:String, kullanici_adi:String){
        sepetInteractor?.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: self.kullanici_adi)
    }
    func yemekUpdate(yemek: SepetYemekler, yemekMiktari: Int) {
        sepetInteractor?.sepetYemekUpdate(yemek: yemek, yemekMiktari: yemekMiktari)
    }
}

extension SepetPresenter: InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemekListesi: [SepetYemekler]) {
        sepetView?.vieweVeriGonder(sepetYemekListesi: sepetYemekListesi)
    }
}

