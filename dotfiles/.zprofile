export PATH=$HOME/.gem/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -d $HOME/Library/Android/sdk ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
fi
