//
//  ViewController.swift
//  Hws_Project6.2
//
//  Created by Burak Erden on 15.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        labels(label: label1, colour: .red, text: "THESE")
        let label2 = UILabel()
        labels(label: label2, colour: .cyan, text: "ARE")
        let label3 = UILabel()
        labels(label: label3, colour: .yellow, text: "SOME")
        let label4 = UILabel()
        labels(label: label4, colour: .green, text: "AWESOME")
        let label5 = UILabel()
        labels(label: label5, colour: .orange, text: "LABELS")
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        
        
//        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
//
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", metrics: nil, views: viewsDictionary))  // H for horizontal
//        }
//
//        let metrics = ["labelHeigh": 80]
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeigh@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", metrics: metrics, views: viewsDictionary))
//
//
//        // V for vertical          (==88) 88 points high        -(>10)-  bottoma at least 10 points space        metrics olarak oluşturduğumuz dictionaryi metrics'e yazıp key valuesini değiştirerek ayarlama yapabiliriz.
//        // [label1(labelHeigh@999)] @999 burada prioarity demek yani label1 herhangi bi layout probleminde 999/1000 önceliği var
//        // [label2(label1)] burada label2 label1 yüksekliğinde olsun diyor. eğer bu iki işlemi yapmasaydık. app çalıştığında ve yan çevrildiğinde bir tane labelımız araya sıkışıyor ve hiç gözükmüyordu. şimdi hepsi eşit bir şekilde dağılmış durumda. çünkü label1'in 1000 olan default priority değerini 999 a düşürüp, heigh ini de diğer labellara verdik. böylece hepsi eşitlendi. anasını avradını sikim
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
//            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else { // eğer previous label yoksa yani en üstteki label ise else bloğu çalışır.
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true // safe areaya bağladık top labelı
            }
            
            previous = label
        }
        label5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        
        
    }

    
    func labels(label: UILabel, colour:UIColor, text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = colour
        label.text = text
        label.sizeToFit()
    }

}

