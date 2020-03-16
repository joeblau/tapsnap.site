// Thene+ScottForstall.swift
// Copyright (c) 2020 Tapsnap, LLC

import Plot
import Publish

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
                  "Resources/fonts/SFSymbolsFallback-Regular.woff2",
              ])
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

        func makeSectionHTML(for _: Section<Site>, context _: PublishingContext<Site>) throws -> HTML {
            HTML()
        }

        func makeItemHTML(for _: Item<Site>, context _: PublishingContext<Site>) throws -> HTML {
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

        func makeTagListHTML(for _: TagListPage, context _: PublishingContext<Site>) throws -> HTML? {
            HTML()
        }

        func makeTagDetailsHTML(for _: TagDetailsPage, context _: PublishingContext<Site>) throws -> HTML? {
            HTML()
        }
    }
}

private extension Node where Context == HTML.BodyContext {
    // MARK: - Hero

    static func hero<T: ScottForstallThemable>(for site: T) -> Node {
        header(
            .h2(.text(site.name)),
            .p(.text(site.description))
        )
    }

    static func play<T: ScottForstallThemable>(for _: T) -> Node {
        section(
            .button(
                .attribute(named: "onClick", value: "alert('hi')", ignoreIfValueIsEmpty: false),
                .h1(.class("icon"), .text("􀊖"))
            )
        )
    }

    // MARK: - Footer

    static func footer<T: ScottForstallThemable>(for site: T) -> Node {
        .footer(
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

    // MARK: - Utility functions

    static func appStoreLink<T: ScottForstallThemable>(for site: T) -> Node {
        .a(
            .href(site.appStoreURL),
            .img(.src("/img/us/app-store-dark.svg"))
        )
    }
}
