return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>fi', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
	vim.keymap.set('n', '<leader>gi', builtin.live_grep, {})
    end,
}
