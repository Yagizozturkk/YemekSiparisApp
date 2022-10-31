//
//  SepetYemeklerCevap.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import Foundation

class SepetYemeklerCevap : Codable {
    var sepet_yemekler: [SepetYemekler]?
    var success: Int?
    
    init(yemekler: [SepetYemekler], success: Int) {
        self.sepet_yemekler = yemekler
        self.success = success
    }
}
