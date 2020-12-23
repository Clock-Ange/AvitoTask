//
//  AdvertViewModel.swift
//  AvitoTask
//
//  Created by Геннадий Махмудов on 23.12.2020.
//

import Foundation

struct AdvertViewModel {
    
    private var dataService = DataService()
    
    private var result: Result!
    private(set) var titleText: String
    private(set) var actionTitle: String
    private(set) var selectedActionTitle: String
    private(set) var list = [Advert]()
    
    
    init() {
        result = dataService.parseResult()
        self.titleText = result.title
        self.actionTitle = result.actionTitle
        self.selectedActionTitle = result.selectedActionTitle
        list = result.list.filter({$0.isSelected})
    }
}

