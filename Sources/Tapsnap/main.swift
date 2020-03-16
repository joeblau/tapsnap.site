// main.swift
// Copyright (c) 2020 Tapsnap, LLC

import Foundation
import Plot
import Publish

struct Tapsnap: ScottForstallThemable {
    enum SectionID: String, WebsiteSectionID {
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://tapsnap.app")!
    var name = "Tapsnap"
    var description = "Fast secure ephemeral video messaging"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var copyright: String = "© 2020 Tapsnap, LLC"
    var appStoreURL: String = "https://apple.com"
}

try Tapsnap().publish(withTheme: .scottForstall)
