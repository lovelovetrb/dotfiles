return {
  cmd = { 'uvx', 'pyrefly', 'lsp' },
  filetypes = { 'python' },
  -- 定義ジャンプは pyright に任せる。
  -- pyrefly は import 行を定義として返すため、両方に問い合わせると
  -- import 行と実体の 2 件が quickfix に並んでしまう。
  on_init = function(client)
    client.server_capabilities.definitionProvider = nil
  end,
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = 'force-on'
      }
    }
  }
}
