-- lua/copy_buffername/init.lua

local M = {} -- このテーブルがモジュールとしてエクスポートされる

-- バッファ名をクリップボードにコピーする関数
M.copy_current_buffer_name = function()
	local filepath = vim.fn.expand('%:p')              -- 現在のバッファの絶対パスを取得
	local filename = vim.fn.fnamemodify(filepath, ':t') -- パスからファイル名のみを抽出

	if filename == "" then
		-- 無名バッファの場合
		vim.notify("This buffer has no name.", vim.log.levels.INFO)
		return
	end

	-- クリップボードにコピー
	vim.fn.setreg('+', filename)
	vim.notify("Copied '" .. filename .. "' to clipboard!", vim.log.levels.INFO)
end

-- プラグインのセットアップ関数（lazy.nvimなどで呼び出される想定）
M.setup = function(opts)
	-- 今のところ設定オプションは不要なので、空でもOK
	-- 必要に応じて、ここでデフォルト値を設定したり、ユーザーオプションをマージしたりする
	opts = opts or {}
	-- print("my_copy_buffername_plugin: setup called!") -- デバッグ用
end

return M
