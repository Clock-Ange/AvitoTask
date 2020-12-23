//
//  ViewController.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 22.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let advertViewModel = AdvertViewModel()
    
    private var collectionView: UICollectionView!
    
    private let cellId = "Cell"
    
    private var selectedIndex: Int?
    private var selectedService = ""
    
    var closeImageView: UIImageView = {
        let close = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        close.clipsToBounds = true
        close.image = UIImage(named: "CloseIconTemplate")!
        close.translatesAutoresizingMaskIntoConstraints = false
        return close
    }()
    
    var topLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Advertisment"
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var chooseButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 80))
        btn.setTitle("Выбрать", for: .normal)
        btn.backgroundColor = UIColor(red: 40/255, green: 165/255, blue: 255/255, alpha: 1)
        btn.layer.cornerRadius = 5.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(closeImageView)
        configureCollectionView()
        view.addSubview(collectionView)
        view.addSubview(topLabel)
        configureTopLabel()
        view.addSubview(chooseButton)
        configureConstraints()
        configureChooseButton()
    }
    
    private func configureTopLabel(){
        topLabel.text = advertViewModel.titleText
    }
    private func configureChooseButton(){
        chooseButton.setTitle(advertViewModel.actionTitle, for: .normal)
        chooseButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        if selectedIndex != nil {
            let ac = UIAlertController(title: "Услуга выбрана!", message: "Вы выбрали услугу: \(selectedService)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Услуга не выбрана", message: "Продолжение без изменений", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        }
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            closeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            topLabel.topAnchor.constraint(equalTo: closeImageView.bottomAnchor, constant: 30),
            topLabel.leadingAnchor.constraint(equalTo: closeImageView.leadingAnchor, constant: 5),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            collectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
            chooseButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            chooseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            chooseButton.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            chooseButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private final func configureCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(AdvertViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advertViewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AdvertViewCell else {
            fatalError("Could not instantiate AdvertViewCell.")
        }
        let advertisment = advertViewModel.list[indexPath.item]
        cell.ad = advertisment
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 5.0
        if (indexPath.item == selectedIndex) {
            cell.checkmarkImageView.image = UIImage(named: "checkmark")
        }else {
            cell.checkmarkImageView.image = .none
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let advertisment = advertViewModel.list[indexPath.item]
        let approximateWidthOfAdTextView = view.frame.width - 10 - 50 - 10 - 20
        let size = CGSize(width: approximateWidthOfAdTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: advertisment.description ?? "Описание отсутствует").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: view.frame.width - 5 - 10 - 15, height: estimatedFrame.height + 20 + 20 + 10 + 18 + 30 + 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AdvertViewCell else {
            fatalError("Could not instantiate AdvertViewCell.")
        }
        let ad = advertViewModel.list[indexPath.item]
        if selectedIndex == indexPath.item {
            cell.checkmarkImageView.image = .none
            selectedIndex = nil
            chooseButton.setTitle(advertViewModel.actionTitle, for: .normal)
        } else {
            selectedIndex = indexPath.item
            chooseButton.setTitle(advertViewModel.selectedActionTitle, for: .normal)
        }
        selectedService = ad.title
        collectionView.reloadData()
    }
    
}

