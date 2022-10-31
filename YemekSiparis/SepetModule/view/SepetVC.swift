//
//  SepetVC.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import UIKit
import Kingfisher

class SepetVC: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var toplamLabel: UILabel!
    @IBOutlet weak var sepetToplamLabel: UILabel!
    @IBOutlet weak var toplamView: UIView!
    
    
    var sepetYemekListe : [SepetYemekler] = []
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
    let kullanici_adi : String = "yagizozturk"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        SepetRouter.createModule(ref: self)
        
        self.navigationItem.title = "Sepet"
        let gorunus = UINavigationBarAppearance()
        gorunus.backgroundColor = UIColor.lightText
        gorunus.titleTextAttributes = [.font: UIFont(name: "Caveat-Bold", size: 25),.foregroundColor: UIColor.darkGray]
        sepetToplamLabel.font = UIFont(name: "Caveat-Bold", size: 23)
        toplamLabel.font = UIFont(name: "Caveat-Bold", size: 23)
        
        sepetTableView.separatorColor = UIColor.lightText
        toplamView.backgroundColor = UIColor.systemGray6
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepettekiYemekleriGetir(kullanici_adi: self.kullanici_adi)
        
    }
}
extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi: [SepetYemekler]) {
        self.sepetYemekListe = sepetYemekListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}
extension SepetVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sepetYemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepetYemekListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetCell", for: indexPath) as! SepetTableViewCell
        cell.yemekFiyatLabel.text = yemek.yemek_fiyat!
        cell.yemekIsimLabel.text = yemek.yemek_adi!
        cell.yemekMiktarLabel.text = yemek.yemek_siparis_adet!
        cell.sepetImageView.kf.setImage(with: yemekResimleriniGetir(yemek_resim_adi: yemek.yemek_resim_adi!))
        let fiyat = Int(yemek.yemek_fiyat!)!
        let adet = Int(yemek.yemek_siparis_adet!)! + Int(cell.miktarStepper.value)
        cell.yemekToplamLabel.text = String(fiyat * adet)
        toplamLabel.text = "\(String(cell.sepetToplam)) ₺"
        
        cell.backgroundColor = UIColor.lightText
        cell.cellView.layer.cornerRadius = 10
        
        return cell
    }
    
    func yemekResimleriniGetir(yemek_resim_adi:String) -> URL {
        let urlString = "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek_resim_adi)"
        let url = URL(string: urlString)
        return url!
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
            let silAct = UIContextualAction(style: .destructive, title: "Sil"){(contextualAct,view,bool) in
            
            let yemek = self.sepetYemekListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme Islemi", message: "\(yemek.yemek_adi!) sepetten cikarilsin mi?", preferredStyle: .alert)
            
            let iptalAct = UIAlertAction(title: "Iptal", style: .cancel)
            alert.addAction(iptalAct)
            
            let evetAct = UIAlertAction(title: "Evet", style: .destructive){action in
                self.sepetPresenterNesnesi?.sepetteYemekSil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi: yemek.kullanici_adi!)
            }
            alert.addAction(evetAct)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAct])
    }
}

/*extension SepetVC {
    func yemekTutarHesapla(yemekMiktari: String,yemekFiyati : String) -> Int {
        var total = 0
        let fiyatTotal = Int(yemekFiyati)!
        let siparisTotal = Int(yemekMiktari)!
        total += fiyatTotal * siparisTotal
        return total
    }
    func totalHesapla(list: [SepetYemekler]) {
        var total = 0
        for o in list {
            total += yemekTutarHesapla(yemekMiktari: o.yemek_siparis_adet!, yemekFiyati: o.yemek_fiyat!)
        }
        self.toplamLabel.text = String(total)
    }
}*/

