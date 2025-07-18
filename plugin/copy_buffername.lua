-- プラグインの初期化とセットアップを呼び出す
-- これにより、lazy.nvimのconfig関数が実行されなくても、最低限の機能が利用できるようになる
-- lazy.nvimがconfigを呼ぶ場合は、この行はなくても問題ないが、他のプラグインマネージャーのために残すことが多い
require('copy_buffername').setup()

-- カスタムコマンドの定義
vim.api.nvim_create_user_command('CopyBufferName', function()
	require('copy_buffername').copy_current_buffer_name()
end, {
	desc = 'Copy current buffer name to clipboard',
	nargs = 0,   -- 引数を取らないコマンド
})

-- キーマッピングの定義 (ノーマルモードで <leader>cb を押すと実行)
vim.api.nvim_set_keymap('n', '<leader>cb', ':CopyBufferName<CR>', {
	noremap = true,
	silent = true,
	desc = 'Copy current buffer name to clipboard',
})
