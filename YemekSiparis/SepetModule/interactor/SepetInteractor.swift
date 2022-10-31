//
//  SepetInteractor.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    let kullanici_adi : String = "yagizozturk"
    
    func sepetYemekleriGetir(kullanici_adi: String) {
        let params: Parameters = ["kullanici_adi": self.kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let sepetListe = answer.sepet_yemekler {
                        self.sepetPresenter?.presenteraVeriGonder(sepetYemekListesi: sepetListe)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sepettenYemekSil(sepet_yemek_id:String, kullanici_adi: String) {
        let params : Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": self.kullanici_adi ]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post, parameters: params).response {response in
            if let data = response.data {
                do {
                    let answer = try JSONSerialization.jsonObject(with: data)
                    print(answer)
                    self.sepetYemekleriGetir(kullanici_adi: kullanici_adi)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sepetYemekUpdate(yemek: SepetYemekler, yemekMiktari: Int) {
        let silParams : Parameters = ["sepet_yemek_id": yemek.sepet_yemek_id, "kullanici_adi": self.kullanici_adi ]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post, parameters: silParams).response {response in
            if let data = response.data {
                do {
                    let answer = try JSONSerialization.jsonObject(with: data)
                    print(answer)
                    //self.sepetYemekleriGetir(kullanici_adi: self.kullanici_adi)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        
        let params : Parameters = ["kullanici_adi" : self.kullanici_adi,
                                   "yemek_siparis_adet": yemek.yemek_siparis_adet,
                                   "yemek_resim_adi": yemek.yemek_resim_adi,
                                   "yemek_adi": yemek.yemek_adi,
                                   "yemek_fiyat": yemek.yemek_fiyat]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONSerialization.jsonObject(with: data)
                        //self.detayPresenter?.presenteraVeriGonder()
                    print(answer)
                    print("sepeteYemekEklendi")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    }

