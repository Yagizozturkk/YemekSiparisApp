//
//  DetayInteractor.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation
import Alamofire

class DetayInteractor : PresenterToInteractorDetayProtocol {
    var detayPresenter : InteractorToPresenterDetayProtocol?
    
    let kullanici_adi : String = "yagizozturk"
    func sepeteYemekEkle(kullanici_adi: String, yemek_siparis_adet: String, yemek_resim_adi: String, yemek_adi: String, yemek_fiyat: String) {
        let params : Parameters = ["kullanici_adi" : self.kullanici_adi,
                                   "yemek_siparis_adet": yemek_siparis_adet,
                                   "yemek_resim_adi": yemek_resim_adi,
                                   "yemek_adi": yemek_adi,
                                   "yemek_fiyat": yemek_fiyat]
        
            AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post,parameters: params).response { response in
                    if let data = response.data {
                        do {
                            let answer = try JSONSerialization.jsonObject(with: data)
                                self.detayPresenter?.presenteraVeriGonder()
                            print(answer)
                            print("sepeteYemekEklendi")
                        }catch{
                            print(error.localizedDescription)
                }
            }
        }
        
    }
}

