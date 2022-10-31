//
//  DetayPresenter.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayView: PresenterToViewDetayProtocol?
    
    var detayInteractor : PresenterToInteractorDetayProtocol?
    let kullanici_adi : String = "yagizozturk"
    
    func sepeteEkle(kullanici_adi: String, yemek_siparis_adet: String, yemek_resim_adi: String, yemek_adi: String, yemek_fiyat: String) {
        detayInteractor?.sepeteYemekEkle(kullanici_adi: self.kullanici_adi,
                                         yemek_siparis_adet: yemek_siparis_adet,
                                         yemek_resim_adi: yemek_resim_adi,
                                         yemek_adi: yemek_adi,
                                         yemek_fiyat: yemek_fiyat)
    }
}

