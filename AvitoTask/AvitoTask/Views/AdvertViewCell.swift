//
//  AdvertViewCell.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 22.12.2020.
//

import UIKit

class AdvertViewCell: UICollectionViewCell {
    
    var ad: Advert! {
        didSet {
            serviceImageView.loadImage(from: ad.icon.f2xf2)
            titleLabel.text = ad.title
            priceLabel.text = ad.price
            descriptionText.text = ad.description
        }
    }
    
    var serviceImageView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Объявление"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var descriptionText: UITextView = {
        let txtView = UITextView()
        txtView.text = "Описание услуги"
        txtView.font = UIFont.systemFont(ofSize: 15)
        txtView.textAlignment = .left
        txtView.isScrollEnabled = false
        txtView.isEditable = false
        txtView.backgroundColor = .clear
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    
    var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Цена"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var checkmarkImageView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = UIImage(named: "checkmark")
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(serviceImageView)
        addSubview(titleLabel)
        addSubview(descriptionText)
        addSubview(priceLabel)
        addSubview(checkmarkImageView)
        configureConstraints()
    }
    
    private func configureConstraints(){
        serviceImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        serviceImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        serviceImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: serviceImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: serviceImageView.trailingAnchor, constant: 5).isActive = true
        descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionText.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 5).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        checkmarkImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        checkmarkImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
