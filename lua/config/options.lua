-- Отключение встроенного проводника файлов (для плагина Nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Настройка нумерации строк в файле и относительная нумерация
vim.opt.nu = true
vim.opt.relativenumber = true

-- Интеграция системного буфера обмена
vim.o.clipboard = "unnamedplus"

-- Чтобы лучше отображались цвета
vim.o.termguicolors = true

-- Настройки отступов
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Автоматическая расстановка отступов
vim.opt.smartindent = true

-- Комфортная прокрутка окна относительно курсора
vim.opt.scrolloff = 5

-- Скрытые буферы
vim.opt.hidden = true

-- Поддержка Nerd Font (иконок, для Lualine)
vim.g.have_nerd_font = true

-- Показывать текущий режим внизу
vim.opt.showmode = false

-- Настройка учета регистра для поиска
-- vim.opt.smartcase = true

-- Отображение дополнительных окон (снизу и справа, а не вверху, по умолчанию)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Подсветка строки, на которой находится курсор
vim.opt.cursorline = false

-- Подсветка при поиске
-- vim.opt.hlsearch = true

-- Проверка орфографии (по умолчанию отключена; переключение через `<leader>sp`, настроено в keymaps.lua)
vim.opt.spell = false
vim.opt.spelllang = "en_us,ru"

-- Метод отображения парных скобок (в плавающем окне)
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Новый интерфейс для командного режима
require("vim._core.ui2").enable()
