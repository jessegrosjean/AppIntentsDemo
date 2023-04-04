# AppIntentsDemo (Xcode 14.3 Bug)

1. Build and run app
2. Open Shortcuts.app
3. Create a new shortcut
4. Add Demo Action from AppIntentsDemo to shorcut
5. Click the "Book" param

## Expected (And working when built on 14.2)

After clicking the "Book" param you see a popup list of Books from library to choose from.

## Actual (only on 14.3)

See an error in Shortcust and Xcode console log "Attempted to fetch dynamic options on parameter books, which does not declare support" in Xcode.

I think the problem is likely connected to fact that on Xcode 14.3 the AppIntents metadata file objects.appintentsmanifest is no longer getting generated.

Please let me (jesse@hogbaysoftware.com) know if you have a workaround.
