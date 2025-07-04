#!/bin/zsh

# Close System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false

###############################################################################
# Calendar                                                                    #
###############################################################################

defaults write com.apple.iCal "first day of week" -int 1

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Screen                                                                      #
###############################################################################

defaults write com.apple.screencapture location -string "${HOME}/Desktop"

###############################################################################
# Finder                                                                      #
###############################################################################

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

defaults write com.apple.dock largesize -float 100
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-br-corner -int 4

###############################################################################
# Safari & WebKit (optional)                                                  #
###############################################################################

if [ -d "/Applications/Safari.app" ]; then
  echo "Safari detected — applying Safari-related preferences..."

  # These may still fail silently depending on macOS security
  defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool true
  defaults write com.apple.Safari ShowFavoritesBar -bool true
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
  defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
  defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
fi

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Activity Monitor                                                            #
###############################################################################

defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
defaults write com.apple.ActivityMonitor IconType -int 5
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
