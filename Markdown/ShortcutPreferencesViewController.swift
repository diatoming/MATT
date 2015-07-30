//
//  ShortcutPreferencesViewController.swift
//  Markdown
//
//  Created by Sash Zats on 7/29/15.
//  Copyright (c) 2015 Sash Zats. All rights reserved.
//

import AppKit
import MASShortcut


class ShortcutPreferencesViewController: NSViewController {
    
    private let shortcutManager = HotkeyManager()
    
    @IBOutlet weak var shortcutView: MASShortcutView! {
        didSet {
            shortcutView.style = MASShortcutViewStyleTexturedRect

            shortcutManager.load()
            shortcutView.shortcutValue = shortcutManager.shortcut
            
            shortcutView.shortcutValueChange = shortcutValueDidChange
        }
    }
    
    private func shortcutValueDidChange(shortcutView: MASShortcutView!) {
        if let shortcut = shortcutView.shortcutValue {
            shortcutManager.registerHotkey(shortcut)
            shortcutManager.save()
        }
    }
}