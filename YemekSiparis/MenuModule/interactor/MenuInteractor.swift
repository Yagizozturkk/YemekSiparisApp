//
//  MenuInteractor.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation
import Alamofire

class MenuInteractor : PresenterToInteractorMenuProtocol {

    var menuPresenter: InteractorToPresenterMenuProtocol?
    func tumYemekleriGetir() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = answer.yemekler {
                        self.menuPresenter?.presenteraVeriGonder(yemekListesi: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }

}
