//
//  StatusBarController.swift
//  EscapeKey
//
//  Created by Fatih Balsoy on 2/28/23.
//


import AppKit

class EscapeKey {
    static public func simulate() {
//        print("ESCAPE")
        let zKeyCode: UInt16 = 53

        // KEY DOWN
        let keyDownEvent = CGEvent(keyboardEventSource: nil, virtualKey: zKeyCode, keyDown: true)
        keyDownEvent?.post(tap: CGEventTapLocation.cghidEventTap)

        // KEY UP
        let keyUpEvent = CGEvent(keyboardEventSource: nil, virtualKey: zKeyCode, keyDown: false)
        keyUpEvent?.post(tap: CGEventTapLocation.cghidEventTap)
    }
}

class StatusBarController {
    private var statusBar: NSStatusBar
    private var escapeKeyItem: NSStatusItem
    private var popover: NSPopover
    
    init(_ popover: NSPopover) {
        self.popover = popover
        self.statusBar = NSStatusBar.system
        self.escapeKeyItem = self.statusBar.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusBarButton = escapeKeyItem.button {
            statusBarButton.image = NSImage(
                systemSymbolName: "escape",
                accessibilityDescription: nil)
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
            
            statusBarButton.action = #selector(toggleEsc(sender:))
            statusBarButton.sendAction(on: [.leftMouseUp, .rightMouseUp])
            statusBarButton.target = self
        }
    }
    
    func simulateKeys(_ button: NSStatusBarButton) {
        let event = NSApp.currentEvent!
        
        if (event.type == .rightMouseUp) {
            togglePopover(sender: button)
        } else {
            EscapeKey.simulate()
        }
    }
    
    @objc func toggleEsc(sender: NSStatusBarButton) {
        simulateKeys(sender)
    }
    
    @objc func togglePopover(sender: AnyObject) {
        if(popover.isShown) {
            hidePopover(sender)
        }
        else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = escapeKeyItem.button {
            popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
        }
    }
    
    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }
}
