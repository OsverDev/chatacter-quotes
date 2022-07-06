//
//  logic.swift
//  QuotesIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class quotesLogic:ObservableObject{
    @Published var completeData = [quotesStructure]()
    init(){
        self.completeData = quoteService.getLocalData()
    }
}
