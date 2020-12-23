//
//  UIImageView+Ext.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 23.12.2020.
//

import UIKit

extension UIImageView {
    public final func loadImage(from url: String){
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {
                print("No image found.")
                return
            }
            let session = URLSession.shared
            
            session.dataTask(with: url) { (data, response, err) in
                if let _ = err {
                    print("No image")
                }
                if let data = data {
                    let loadedImage = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }.resume()
        }
    }
}
