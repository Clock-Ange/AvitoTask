//
//  Advert.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 22.12.2020.
//

import Foundation

struct Adverts: Codable {
    let status: String
    let result: Result
}
struct Result: Codable {
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [Advert]
}
struct Advert: Codable {
    let id: String
    let title: String
    let description: String?
    let icon: Sizes
    let price: String
    let isSelected: Bool
}
struct Sizes: Codable {
    let f2xf2: String
    private enum CodingKeys : String, CodingKey {
        case f2xf2 = "52x52"
    }
}


//"status": "ok",
//"result": {
//  "title": "Сделайте объявление заметнее на 7 дней",
//  "actionTitle": "Продолжить без изменений",
//  "selectedActionTitle": "Выбрать",
//  "list": [
//    {
//      "id": "xl",
//      "title": "XL объявление",
//      "description": "Пользователи смогут посмотреть фотографии, описание и телефон прямо из результатов поиска.",
//      "icon": {
//        "52x52": "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-xl-52.png"
//      },
//      "price": "356 ₽",
//      "isSelected": true
//    },
