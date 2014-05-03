class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildStatus(setupMenu)
  end
 
  def buildStatus(menu)
    @statusBar = NSStatusBar.systemStatusBar
    @item = @statusBar.statusItemWithLength(NSVariableStatusItemLength)
    @item.retain
    @item.setTitle("Tomahawk")
    @item.setHighlightMode(true)
    @item.setMenu(menu)
    #@item.image()
  end
 
  def setupMenu
    menu = NSMenu.new
    menu.initWithTitle 'Menubar App'
 
    mi = NSMenuItem.new
    mi.title = 'Hello!'
    mi.action = 'sayHello:'
    menu.addItem mi

    mi = NSMenuItem.new
    mi.title = 'Test notification'
    mi.action = 'showNotification:'
    menu.addItem mi

    mi = NSMenuItem.new
    mi.title = 'Quit'
    mi.action = 'terminate:'
    menu.addItem mi

    menu
  end

  def showNotification(sender)
    notification = NSUserNotification.alloc.init
    notification.title = "New commits"
    notification.informativeText = "There are no new commits."
    notification.soundName = NSUserNotificationDefaultSoundName
    NSUserNotificationCenter.defaultUserNotificationCenter.scheduleNotification(notification)
  end

  def sayHello(sender)
    alert = NSAlert.new
    alert.messageText = 'This is Rubymotion Status Bar Application'
    alert.informativeText = 'Cool, huh?'
    alert.alertStyle = NSInformationalAlertStyle
    alert.addButtonWithTitle("Yeah!")
    response = alert.runModal
  end
end
