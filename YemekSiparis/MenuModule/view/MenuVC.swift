//
//  ViewController.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import UIKit
import Kingfisher


class MenuVC: UIViewController {

    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var yemekListe = [Yemekler]()
    @IBOutlet weak var buttonSepet: UIBarButtonItem!
    var menuPresenterNesnesi : ViewToPresenterMenuProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        MenuRouter.createModule(ref: self)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        tasarim.minimumLineSpacing = 5
        tasarim.minimumInteritemSpacing = 2
        
        let ekranGenislik = UIScreen.main.bounds.width
        let hucreGen = (ekranGenislik - 30)/2
        tasarim.itemSize = CGSize(width: hucreGen, height: ekranGenislik*2/3)
        
        
        collectionView.collectionViewLayout = tasarim
    }
    override func viewWillAppear(_ animated: Bool) {
        menuPresenterNesnesi?.yemekleriGetir()
        buttonSepet.image = UIImage(named: "shopping_cart-shopping_cart_symbol")
        self.navigationItem.title = "Menu"
        self.navigationItem.backButtonTitle = "Menu"
        
        
        let gorunus = UINavigationBarAppearance()
        gorunus.backgroundColor = UIColor.lightText
        gorunus.titleTextAttributes = [.font: UIFont(name: "Caveat-Bold", size: 25),.foregroundColor: UIColor.darkGray]
        
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = gorunus
        navigationController?.navigationBar.compactAppearance = gorunus
        navigationController?.navigationBar.scrollEdgeAppearance = gorunus
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as!DetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
    @IBAction func toSepetButton(_ sender: Any) {
        performSegue(withIdentifier: "toSepetFromMenu", sender: nil)
    }
}

extension MenuVC: PresenterToViewMenuProtocol {
    func vieweVeriGonder(yemekListesi: [Yemekler]) {
        self.yemekListe = yemekListesi
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension MenuVC : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        yemekListe.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemekListe[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        cell.yemekIsimLabel.text = "\(yemek.yemek_adi!)"
        cell.yemekImageView.kf.setImage(with:yemekResimGosterKF(yemek_resim_adi: yemek.yemek_resim_adi!),placeholder: UIImage.actions)
        
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.backgroundColor = UIColor.quaternarySystemFill.cgColor
        
        
        cell.yemekIsimLabel.font = UIFont(name: "Caveat-Bold", size: 23)
        cell.yemekFiyatLabel.font = UIFont(name: "Caveat-Regular", size: 20)
        
        return cell
    }
    
    func yemekResimGosterKF(yemek_resim_adi: String) -> URL? {
        let urlString = "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek_resim_adi)"
        let url = URL(string: urlString)
        return url
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
