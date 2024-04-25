export PATH=$HOME/.gem/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
if command -v pfetch >/dev/null 2>&1; then
    pfetch # コマンドが存在すればpfetchを実行
fi
