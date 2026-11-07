-- Перейти в классический проводник neovim
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

-- Перейти в проводник Nvim-tree
-- vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', { desc = "Toggle NvimTree" })

-- Настройка для отключения подсветки поиска (?)
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Позволяет перемещать выделенные блоки вверх-вниз
vim.keymap.set("v", "J", ":'<,'>move '>+1<CR>gv")
vim.keymap.set("v", "K", ":'<,'>move '<-2<CR>gv")

-- настройка независимости команд от раскладки клавиатуры
-- Пример для русской раскладки (йцукен -> qwerty)
-- vim.o.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э;,яz,чx,сc,мv,иb,тn,ьm,б,,ю."
-- Включаем опцию, чтобы langmap работал
-- vim.o.langremap = true

-- Перемещение между окнами с помощью Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Выход из Terminal mode по Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Выйти из Terminal mode" })

-- Навигация по окнам из Terminal mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Окно влево" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Окно вниз" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Окно вверх" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Окно вправо" })

-- Новая вкладка
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "New tab" })

-- Открыть терминал в нижнем сплите
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("split | terminal")
	-- не заходить в terminal-mode
	-- vim.cmd("startinsert") -- сразу войти в terminal-mode
end, { desc = "Open terminal" })

-- Открыть терминал в новой вкладке
vim.keymap.set("n", "<leader>tT", "<cmd>tabnew<cr><cmd>terminal<cr>", { desc = "New terminal in new tab" })

-- Орфография
vim.keymap.set(
	"n",
	"<leader>sp",
	":set spell!<CR>",
	{ desc = "Переключить проверку написания" }
)
vim.keymap.set("n", "<leader>se", "]s", { desc = "К следующей опечатке" })
vim.keymap.set("n", "<leader>sf", "z=", { desc = "Предложения по написанию" })

-- Переключение wrap/nowrap по нажатию <leader>w
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { noremap = true, silent = true, desc = "Toggle Wrap" })

-- Диагностика и применение действий к коду
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Отключить стандартное поведение пробела
-- vim.keymap.set("n", "<leader>g", "<Nop>", { silent = true, desc = "Disable leader+g" })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Отключить стандартное действие привязки `gx` для плагина url-open, открытия ссылок под курсором
vim.g.netrw_nogx = 1
