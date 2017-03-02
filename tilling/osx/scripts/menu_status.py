# -*- coding: utf-8 -*-
import subprocess
import sys

from Foundation import *
from AppKit import *
from PyObjCTools import AppHelper

class MyApplicationAppDelegate(NSObject):
    def applicationDidFinishLaunching_(self, sender):
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength_(NSVariableStatusItemLength)
        self.statusItem.setTitle_("Activation") # TODO Monitor Mode KWM
        self.statusItem.setHighlightMode_(FALSE)
        self.statusItem.setEnabled_(TRUE)

        # menu
        self.menu = NSMenu.alloc().init()
        menuitem = NSMenuItem.alloc().initWithTitle_action_keyEquivalent_('Quit', 'terminate:', '')
        self.menu.addItem_(menuitem)
        self.statusItem.setMenu_(self.menu)

        self.timer = NSTimer.alloc().initWithFireDate_interval_target_selector_userInfo_repeats_(NSDate.date(), 3.0, self, 'refresh:', None, True)
        NSRunLoop.currentRunLoop().addTimer_forMode_(self.timer, NSDefaultRunLoopMode)
        self.timer.fire()

    def refresh_(self, notifications):
        try:
            command = "kwmc query space active mode".split(" ")
            mode = subprocess.Popen(command, stdout=subprocess.PIPE).communicate()[0].rstrip()
            self.statusItem.setTitle_(mode)
        except:
            # En cas d’erreur on quit l’app
            sys.exit(255)

def hide_dock_icon():
    NSApplicationActivationPolicyRegular = 0
    NSApplicationActivationPolicyAccessory = 1
    NSApplicationActivationPolicyProhibited = 2
    NSApp.setActivationPolicy_(NSApplicationActivationPolicyProhibited)

app = NSApplication.sharedApplication()
delegate = MyApplicationAppDelegate.alloc().init()
app.setDelegate_(delegate)
hide_dock_icon()
AppHelper.runEventLoop()
