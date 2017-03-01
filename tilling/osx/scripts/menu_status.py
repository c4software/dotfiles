from Foundation import *
from AppKit import *
from PyObjCTools import AppHelper

class MyApplicationAppDelegate(NSObject):
    def applicationDidFinishLaunching_(self, sender):
        self.statusItem = NSStatusBar.systemStatusBar().statusItemWithLength_(NSVariableStatusItemLength)
        self.statusItem.setTitle_("Float") # TODO Monitor Mode KWM
        self.statusItem.setHighlightMode_(FALSE)
        self.statusItem.setEnabled_(TRUE)

        # menu
        self.menu = NSMenu.alloc().init()
        menuitem = NSMenuItem.alloc().initWithTitle_action_keyEquivalent_('Quit', 'terminate:', '')
        self.menu.addItem_(menuitem)
        self.statusItem.setMenu_(self.menu)

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
