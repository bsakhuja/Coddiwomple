//
//  Place.swift
//  Coddiwomple
//
//  Created by Brian Sakhuja on 3/11/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation
import CDYelpFusionKit
import RealmSwift

class Place: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var id: String = ""
    var categories = [CDYelpCategory]()
    @objc dynamic var isSaved: Bool = false
}
