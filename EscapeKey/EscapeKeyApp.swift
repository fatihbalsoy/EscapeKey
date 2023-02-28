//
//  EscapeKeyApp.swift
//  EscapeKey
//
//  Created by Fatih Balsoy on 2/28/23.
//

import SwiftUI

@main
struct EscapeKeyApp: App {
    
    var statusBar: StatusBarController?
    var popover = NSPopover.init()
    
    init() {
        let contentView = ContentView()
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)
        statusBar = StatusBarController(popover)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
