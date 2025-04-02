prop=`defaults read com.apple.inputmethod.Kotoeri JIMPrefPunctuationTypeKey`
if [ $prop -eq 0 ]; then
    defaults write com.apple.inputmethod.Kotoeri JIMPrefPunctuationTypeKey -int 3
else
    defaults write com.apple.inputmethod.Kotoeri JIMPrefPunctuationTypeKey -int 0
fi
killall -HUP JapaneseIM-RomajiTyping
