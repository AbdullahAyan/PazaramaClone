//
//  ViewController.swift
//  PazaramaClone
//
//  Created by Abdullah Ayan on 11.10.2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    let texts = ["Kartlarım","Fatura Öde","Maximum Kampanyalar","Para Gönder","Tümünü Gör"]
    let secondTexts = ["Online Alışveriş","Sinema Bileti","Market Siparişi","Pazarama Tatil","Araçta Öde","Ulaşım Kartları","Dijital Kod Market","Pazarama Pet"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
        let leftImageView = UIImageView(frame: CGRect(x: 10.0, y: 0.0, width: 100, height: 50))
        leftImageView.tintColor = UIColor(named: "pink")
        leftImageView.image = UIImage(systemName: "magnifyingglass")
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        
        mainView.layer.cornerRadius = 20        
    }
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.restorationIdentifier == "top" {
            return texts.count
        }
        if collectionView.restorationIdentifier == "second" {
            return secondTexts.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.restorationIdentifier == "top" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "top", for: indexPath) as! CustomCollectionViewCell
            
            cell.label.text = texts[indexPath.item]
            
            cell.button.setImage(UIImage(named: texts[indexPath.item]), for: .normal)
            cell.button.imageView?.contentMode = .scaleAspectFit
            cell.button.imageView?.clipsToBounds = true
            
            cell.button.layer.shadowColor = UIColor.black.cgColor
            cell.button.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.button.layer.shadowRadius = 2.5
            cell.button.layer.shadowOpacity = 0.5
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "second", for: indexPath) as! SecondCollectionViewCell
            
            cell.label.text = secondTexts[indexPath.item]
            
            cell.button.setImage(UIImage(named: secondTexts[indexPath.item]), for: .normal)
            cell.button.imageView?.contentMode = .scaleAspectFit
            cell.button.imageView?.clipsToBounds = true
            cell.button.layer.cornerRadius = 100
            
            cell.button.layer.shadowColor = UIColor.black.cgColor
            cell.button.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.button.layer.shadowRadius = 4
            cell.button.layer.shadowOpacity = 0.2
            
            return cell
        }
    }
    
    

    
    
}
