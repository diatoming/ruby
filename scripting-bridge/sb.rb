#!/usr/bin/ruby

# source
# http://www.macosxautomation.com/applescript/features/scriptingbridge.html
# http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual\
# /ScriptingBridgeConcepts/UsingScriptingBridge/UsingScriptingBridge.html

require 'osx/cocoa'
include OSX
OSX.require_framework 'ScriptingBridge'

# If you don’t know an application’s bundle identifier, you can find it 
# by looking for the value of CFBundleIdentifier property in the Info.plist 
# file stored in the application bundle.
iTunes = OSX::SBApplication.applicationWithBundleIdentifier_('com.apple.iTunes')

p iTunes.currentTrack.name
puts iTunes.currentTrack.name


