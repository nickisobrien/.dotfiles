-- Lazy.nvim Setup
vim.g.mapleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugin list
  { "sainnhe/sonokai" },
  { "itchyny/lightline.vim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "preservim/nerdtree" },
  { "ryanoasis/vim-devicons" },
  { "Xuyuanp/nerdtree-git-plugin" },
  { "junegunn/gv.vim" },
  { "tpope/vim-fugitive" },
  { "airblade/vim-gitgutter" },
  { "tpope/vim-rhubarb" },
  { "zbirenbaum/copilot.lua" },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  { "plasticboy/vim-markdown" },
  { "godlygeek/tabular" },
  { "tpope/vim-commentary" },
  { "numToStr/Comment.nvim" },
  { "sbdchd/neoformat" },
  { "tpope/vim-surround" },
  { "neoclide/coc.nvim", branch = "release" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  { "nvim-tree/nvim-web-devicons" },
  { "sindrets/diffview.nvim" },
  { "stevearc/dressing.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "HakonHarnes/img-clip.nvim" },
  { "mfussenegger/nvim-dap" },
  { "mxsdev/nvim-dap-vscode-js" },
  { "rcarriga/nvim-dap-ui" },
  { "nvim-neotest/nvim-nio" },
  { "mfussenegger/nvim-dap-python" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "RRethy/vim-illuminate" },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      mappings = {
        ask = "<leader>aa",
        submit = {
          normal = "<Enter>",
          insert = "<C-l>",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})

-- General Vim settings
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.number = true
-- vim.o.nofoldenable = true
vim.o.signcolumn = "yes"
vim.o.encoding = "utf-8"
vim.o.updatetime = 300

-- Colorscheme
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_enable_italic = 1
vim.cmd("colorscheme sonokai")

-- Lightline
vim.g.lightline = {}
vim.g.lightline.colorscheme = 'sonokai'

-- Key Mappings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope file_browser<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fj', '<cmd>Telescope resume<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nt', '<cmd>NERDTreeFocus<cr>', { noremap = true, silent = true })
vim.g.NERDTreeShowHidden = 1
vim.api.nvim_set_keymap('n', '<leader>gy', ':GBrowse<cr>', { noremap = true, silent = true })

-- Neoformat autocmd for formatting
vim.cmd([[
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat
]])

-- Lua Setup for various plugins
require('Comment').setup()
require('telescope').load_extension('file_browser')

require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom",
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      next = "<C-j>",
      prev = "<C-k>",
    },
  },
})

require("dap-python").setup("/Users/nickobrien/miniconda3/envs/harvey_backend/bin/python")
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)

-- DAP Keymaps
local dap = require("dap")
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

-- JavaScript-based languages DAP setup
require("dap-vscode-js").setup({
  debugger_path = "/Users/nickobrien/vscode-js/vscode-js-debug",
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }
for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end

-- CoC Settings
vim.cmd([[
  set nobackup
  set nowritebackup
  set updatetime=300
  set signcolumn=yes

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <c-space> coc#refresh()

  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nnoremap <silent> K :call ShowDocumentation()<CR>
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  autocmd CursorHold * silent call CocActionAsync('highlight')
  nmap <leader>rn <Plug>(coc-rename)
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>ac  <Plug>(coc-codeaction-cursor)
  nmap <leader>as  <Plug>(coc-codeaction-source)
  nmap <leader>qf  <Plug>(coc-fix-current)

  nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
  xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
  nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

  nmap <leader>cl  <Plug>(coc-codelens-action)
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  command! -nargs=0 Format :call CocActionAsync('format')
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
]])
