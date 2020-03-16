//
//  File.swift
//  
//
//  Created by Joe Blau on 3/15/20.
//

import Publish

public protocol ScottForstallThemable: Website {
    var copyright: String { get set }
    var appStoreURL: String { get set }
}
