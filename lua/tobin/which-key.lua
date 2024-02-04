local kind = require('tobin.kind')

local wk = lvim.builtin.which_key

wk.mappings["a"] = { ":Alpha<cr>", kind.icons.screen .. " Dashboard" }

wk.mappings["l"]["t"] = { ":LvimToggleFormatOnSave<cr>", kind.symbols_outline.File .. " Toggle format-on-save" }
wk.mappings["l"]["R"] = { ":LspRestart<cr>", kind.icons.exit .. " Restart" }

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  ' ' .. kind.cmp_kind.EnumMember .. " Search Word Under Cursor"
}

wk.mappings["m"] = {
  name = ' ' .. kind.todo_comments.PERF .. " Harpoon",
  m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
  t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
  n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
  p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

local picker = require('window-picker')
-- local function pick_a_window()
--   local picked_window_id = picker.pick_window({
--     include_current_win = true
--   }) or vim.api.nvim_get_current_win()
--   vim.api.nvim_set_current_win(picked_window_id)
-- end 

function Pick_a_window()
    local status, picked_window_id = pcall(function()
        return picker.pick_window({ include_current_win = true })
    end)
    
    if not status then
        print("Error picking a window: " .. picked_window_id)  -- picked_window_id will contain the error message
        return
    end

    picked_window_id = picked_window_id or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end

-- Swap two windows using the awesome window picker
function Swap_windows()
    local status, window = pcall(function()
        return require('window-picker').pick_window({ include_current_win = false })
    end)

    if not status then
        print("Error picking a window: " .. window)  -- window will contain the error message
        return
    end

    if window == nil then
        print("No window selected")
        return
    end

    local current_window = vim.api.nvim_get_current_win()
    local target_buffer = vim.api.nvim_win_get_buf(window)
    local current_buffer = vim.api.nvim_win_get_buf(current_window)

    -- Swap the buffers
    vim.api.nvim_win_set_buf(window, current_buffer)
    vim.api.nvim_win_set_buf(current_window, target_buffer)
end


wk.mappings["W"] = {
  name = ' ' .. kind.icons.screen .. " Window Ctrl",
  h = { '<C-w>|', 'Maximize window horizontally (|)' },
  v = { '<C-w>_', 'Maximize window vertically (_)' },
  ['='] = { '<C-w>=', 'Resize windows equally' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
  W = { ":lua Pick_a_window()<CR>", "Pick a Window" },
  S = { "lua: Swap_windows()<CR>", "Swap Windows" }
}

wk.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

wk.mappings["x"] = {
  name = "+diagnostics/quickfix",
}
