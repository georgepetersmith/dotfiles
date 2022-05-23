_G.gnvim = {}
local stdpath = vim.fn.stdpath

gnvim.default_compile_path = stdpath "config" .. "/lua/packer_compiled.lua"
gnvim.base_notification = { title = "Nvim" }
gnvim.user_terminals = {}

function gnvim.initialize_packer()
  local packer_avail, packer = pcall(require, "packer")
  if not packer_avail then
    local packer_path = stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    }
    print "Cloning packer...\nSetup gnvim"
    vim.cmd "packadd packer.nvim"
    packer_avail, packer = pcall(require, "packer")
    if not packer_avail then
      error("Failed to load packer at:" .. packer_path .. "\n\n" .. packer)
    end
  end
  return packer
end

function gnvim.vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

function gnvim.compiled()
  local run_me, _ = loadfile(gnvim.default_compile_path)
  if run_me then
    run_me()
  else
    print "Please run :PackerSync"
  end
end

function gnvim.url_opener()
  if vim.fn.has "mac" == 1 then
    vim.fn.jobstart({ "open", vim.fn.expand "<cfile>" }, { detach = true })
  elseif vim.fn.has "unix" == 1 then
    vim.fn.jobstart({ "xdg-open", vim.fn.expand "<cfile>" }, { detach = true })
  else
    vim.notify("gx is not supported on this OS!", "error", gnvim.base_notification)
  end
end

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()
function gnvim.toggle_term_cmd(term_details)
  if type(term_details) == "string" then
    term_details = { cmd = term_details, hidden = true }
  end
  local term_key = term_details.cmd
  if vim.v.count > 0 and term_details.count == nil then
    term_details.count = vim.v.count
    term_key = term_key .. vim.v.count
  end
  if gnvim.user_terminals[term_key] == nil then
    gnvim.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
  end
  gnvim.user_terminals[term_key]:toggle()
end

function gnvim.add_cmp_source(source)
  local priorities = {
    nvim_lsp = 1000,
    luasnip = 750,
    buffer = 500,
    path = 250,
  }
  local priority = priorities[source]
  source = type(source) == "string" and { name = source } or source
  if priority then
    source.priority = priority
  end
  local cmp_available, cmp = pcall(require, "cmp")
  if cmp_available then
    local config = cmp.get_config()
    table.insert(config.sources, source)
    cmp.setup(config)
  end
end

function gnvim.alpha_button(kbd_command, txt)
  local sc_ = kbd_command:gsub("%s", ""):gsub("LDR", "<leader>")
  if vim.g.mapleader then
    kbd_command = kbd_command:gsub("LDR", vim.g.mapleader == " " and "SPC" or vim.g.mapleader)
  end
  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = {
      position = "center",
      text = txt,
      shortcut = kbd_command,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "DashboardCenter",
      hl_shortcut = "DashboardShortcut",
    },
  }
end

function gnvim.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

function gnvim.delete_url_match()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == "HighlightURL" then
      vim.fn.matchdelete(match.id)
    end
  end
end

function gnvim.set_url_match()
  gnvim.delete_url_match()
  if vim.g.highlighturl_enabled then
    vim.fn.matchadd(
      "HighlightURL",
      "\\v\\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)%([&:#*@~%_\\-=?!+;/0-9a-z]+%(%([.;/?]|[.][.]+)[&:#*@~%_\\-=?!+/0-9a-z]+|:\\d+|,%(%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)@![0-9a-z]+))*|\\([&:#*@~%_\\-=?!+;/.0-9a-z]*\\)|\\[[&:#*@~%_\\-=?!+;/.0-9a-z]*\\]|\\{%([&:#*@~%_\\-=?!+;/.0-9a-z]*|\\{[&:#*@~%_\\-=?!+;/.0-9a-z]*})\\})+",
      15
    )
  end
end

function gnvim.toggle_url_match()
  vim.g.highlighturl_enabled = not vim.g.highlighturl_enabled
  gnvim.set_url_match()
end

return gnvim
