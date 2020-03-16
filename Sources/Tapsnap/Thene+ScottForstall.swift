//
//  File.swift
//  
//
//  Created by Joe Blau on 3/15/20.
//
import Publish
import Plot



public extension Theme where Site: ScottForstallThemable {
    static var scottForstall: Self {
        Theme(htmlFactory: ScottForstallHTMLFactory(),
              resourcePaths: [
                "Resources/css/hero.css",
                "Resources/css/style.css",
                "Resources/img/us/app-store-dark.svg",
                "Resources/img/us/app-store-light.svg",
                "Resources/fonts/sfsymbols-font-stylesheet.css",
                "Resources/fonts/SFSymbolsFallback-Regular.eot",
                "Resources/fonts/SFSymbolsFallback-Regular.svg",
                "Resources/fonts/SFSymbolsFallback-Regular.ttf",
                "Resources/fonts/SFSymbolsFallback-Regular.woff",
                "Resources/fonts/SFSymbolsFallback-Regular.woff2"
            ]
        )
    }

    private struct ScottForstallHTMLFactory: HTMLFactory {
        func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index,
                      on: context.site,
                      titleSeparator: " | ",
                      stylesheetPaths: [Path("css/hero.css"),
                                        Path("fonts/sfsymbols-font-stylesheet.css")]),
                .body(
                    .div(
                        .class("iframe-wrapper"),
                        .iframe(.src("https://player.vimeo.com/video/76979871?background=1&autoplay=1&loop=1&byline=0&title=0"))
                        ),
                    .hero(for: context.site),
                    .play(for: context.site),
                    .footer(for: context.site)
                )
            )
        }
        
        func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
            HTML()
        }
        
        func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
            HTML()
        }
        
        func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page,
                      on: context.site,
                      titleSeparator: " | ",
                      stylesheetPaths: [Path("/css/style.css"),
                                        Path("/fonts/sfsymbols-font-stylesheet.css")],
                      rssFeedPath: .defaultForRSSFeed,
                      rssFeedTitle: nil),
                .body(
                    .footer(for: context.site)
                )
            )
        }
        
        func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
            HTML()
        }
        
        func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
            HTML()
        }
    }
}


private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
   
    // MARK: - Hero
    
    static func hero<T: ScottForstallThemable>(for site: T) -> Node {
        return header(
            .h2(.text(site.name)),
            .p(.text(site.description))
        )
    }
    
    static func play<T: ScottForstallThemable>(for site: T) -> Node {
        return section(
            .button(
                .attribute(named: "onClick", value: "alert('hi')", ignoreIfValueIsEmpty: false),
                .h1(.class("icon"), .text("􀊖"))
                
            )
        )
    }
    
    // MARK: - Footer

    static func footer<T: ScottForstallThemable>(for site: T) -> Node {
        return .footer(
            .appStoreLink(for: site),
            .br(),
            .br(),
            .a(.href("/"), .text("Home")),
            .text(" • "),
            .a(.href("/blog"), .text("Blog")),
            .text(" • "),
            .a(.href("https://github.com/tapsnapapp"), .text("GitHub")),
            .text(" • "),
            .a(.href("mailto:support@tapsnap.app"), .text("Contact")),
            .text(" • "),
            .a(.href("/privacy"), .text("Privacy")),
            .br(),
            .element(named: "small", text: site.copyright)
        )
    }
    
    
    //MARK: - Utility functions
    
    static func appStoreLink<T: ScottForstallThemable>(for site: T) -> Node {

        return .a(
            .href(site.appStoreURL),
            .img(.src("/img/us/app-store-dark.svg"))
        )
    }
}


