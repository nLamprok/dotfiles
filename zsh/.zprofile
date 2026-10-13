
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Build against the SDK matching this macOS version. Software Update can install
# Command Line Tools for a newer macOS whose SDK the current linker can't read
# (e.g. "ld: tapi error: unknown architecture arm64e.x1"), and xcrun picks the
# newest SDK by default.
_sdk="/Library/Developer/CommandLineTools/SDKs/MacOSX$(sw_vers -productVersion | cut -d. -f1).sdk"
[ -d "$_sdk" ] && export SDKROOT="$_sdk"
unset _sdk
