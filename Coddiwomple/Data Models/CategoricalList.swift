//
//  CategoricalList.swift
//  
//
//  Created by Brian Sakhuja on 3/11/19.
//

import Foundation
import RealmSwift

class CategoricalList: Object {
    @objc dynamic var nameOfCategory: String = ""
    var items = List<Place>()
}
