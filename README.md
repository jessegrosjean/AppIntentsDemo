# AppIntentsDemo (Bug)

1. Build and run app
2. Open Shortcuts.app
3. Create a new shortcut
4. Add Demo Action from AppIntentsDemo to shorcut
5. Click the "Book" param

Expected: is you see a list of Books to choose from.
Actual: see an error in Shortcust and console log "Attempted to fetch dynamic options on parameter books, which does not declare support" in Xcode.

I "think" this problem might be related to Xcode 14.3 and it seems to no longer generate AppIntents metadata file objects.appintentsmanifest that was being generated in previous versions of Xcode.
