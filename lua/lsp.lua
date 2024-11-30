-- Haskell Language Server config [HLScdb]
require('lspconfig').hls.setup{
}

require('lspconfig').elixirls.setup{
    -- cmd = { "/home/nathanael/.local/bin/elixirls/language_server.sh" }
    cmd = { "elixir-ls" }
}

require('lspconfig').erlangls.setup{
}

require('lspconfig').purescriptls.setup{
}

vim.cmd([[
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
]])

vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, { silent = true, })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, })

vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, { silent = true, })
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, { silent = true, })
vim.keymap.set('n', '<leader>eo', vim.diagnostic.open_float, { silent = true, })
