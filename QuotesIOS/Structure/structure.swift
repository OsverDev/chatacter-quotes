//
//  structure.swift
//  QuotesIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class quotesStructure: Identifiable,Decodable{
    var id:UUID?
    var name:String
    var img:String
    var quotes:[String]
}
