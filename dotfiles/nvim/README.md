# Neovim 設定

## 特徴

### プラグインマネージャー
- **lazy.nvim** - 高速でモダンなプラグインマネージャー（遅延読み込み対応）

### LSP & 開発環境
- **言語サーバーサポート**
  - Python (Pyright, Ruff)
  - TypeScript/JavaScript (ts_ls)
  - Lua (lua_ls)
- **nvim-treesitter** - 高度な構文ハイライトとコード解析
- **nvim-cmp** - インテリジェントなコード補完
- **GitHub Copilot** - AI駆動のコード提案

### UI & 外観
- **透過背景** - クリーンな見た目のためのカスタム透過設定
- **テーマ**
  - Catppuccin
  - Themeryによる簡単なテーマ切り替え
- **ステータスライン**
  - lualine.nvim - エレガントなステータスライン
  - incline.nvim - フローティングファイル情報
- **Dashboard** - 素早いナビゲーションのためのカスタムダッシュボード
- **noice.nvim** - メッセージ、コマンドライン、ポップアップの強化UI
- **barbar.nvim** - タブライン/バッファ管理
- **nvim-tree** - ファイルエクスプローラー
- **nvim-highlight-color** - カラーコードのハイライト

### 生産性ツール
- **Telescope** - ファイル、バッファなどのファジーファインダー
- **Trouble** - 診断とクイックフィックスのための見やすいリスト
- **LazyGit** - Git インターフェース統合
- **gitsigns** - Git の装飾と差分表示
- **toggleterm** - ターミナル管理
- **namu** - ノート作成サポート

## ディレクトリ構造

```
nvim/
├── init.lua              # エントリーポイント
├── lazy-lock.json        # プラグインバージョンロックファイル
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # プラグインマネージャー設定
│   │   ├── options.lua   # エディタオプション
│   │   ├── keymaps.lua   # キーマッピング
│   │   ├── lsp.lua       # LSP設定
│   │   └── others.lua    # その他の設定
│   └── plugins/
│       ├── *.lua         # 個別プラグイン設定
│       └── themes/
│           └── catppuccin.lua
└── lsp/
    ├── lua_ls.lua        # Lua LSP設定
    ├── pyright.lua       # Python LSP設定
    ├── ruff.lua          # Python リンター設定
    └── ts_ls.lua         # TypeScript LSP設定
```

## 主要設定

### エディタオプション
- 相対行番号付きの行番号表示
- 2スペースインデント（タブをスペースに変換）
- システムクリップボード連携
- トゥルーカラー対応
- グローバルステータスライン

### リーダーキー
- `<Space>` - メインリーダーキー
- `\` - ローカルリーダーキー

## インストール

1. Neovim 0.9以上がインストールされていることを確認
2. この設定をNeovimの設定ディレクトリにクローン：
   ```bash
   git clone <your-repo> ~/.config/nvim
   ```
3. Neovimを起動 - lazy.nvimが自動的にプラグインをインストール
4. 初回インストール後、Neovimを再起動

## 必要要件

- Neovim >= 0.9.0
- Git
- Nerd Font（アイコン表示用）
- Node.js（LSPサーバー用）
- Python 3 with pip（Python LSP用）
- ripgrep（Telescope用）

## LSPサーバー

必要なLSPサーバーをインストール：

```bash
# Python
pip install pyright ruff

# TypeScript/JavaScript
npm install -g typescript typescript-language-server

# Lua (lua_lsで自動インストール)
```

## カスタマイズ

- **テーマ**: Themeryコマンドでインストール済みテーマを切り替え
- **プラグイン**: `lua/plugins/` に新しいプラグイン設定を追加
- **LSP**: `lsp/` ディレクトリで言語サーバーを設定
- **キーマップ**: `lua/config/keymaps.lua` を編集

## ライセンス

個人設定 - ご自由にお使いいただき、必要に応じて変更してくださいませ。
