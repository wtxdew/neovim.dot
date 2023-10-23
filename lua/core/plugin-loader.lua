local plugin_loader = {}

local in_headless = #vim.api.nvim_list_uis() == 0
local compile_path = vim.fn.stdpath "config" .. "/plugin/packer_compiled.lua"
-- Log = require("log")

function plugin_loader.init(opts)
    opts = opts or {}

    local install_path = opts.install_path or vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    local package_root = opts.package_root or vim.fn.stdpath "data" .. "/site/pack"
    local log_level = in_headless and "debug" or "warn"

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
        vim.cmd "packadd packer.nvim"
    end

    local _, packer = pcall(require, "packer")
    packer.util = require('packer.util')
    packer.init {
        ensure_dependencies = true,
        snapshot = 'default.json',
        snapshot_path = packer.util.join_paths(vim.fn.stdpath('config'), 'snapshots'),
        package_root = package_root,
        compile_path = compile_path,
        log = { level = log_level },
        auto_clean = true,
        preview_updates = true,
        git = {
            clone_timeout = 300,
            subcommands = {
                -- this is more efficient than what Packer is using
                fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
            },
        },
        max_jobs = 50,
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
        luarocks = {
            python_cmd = 'python3' -- Set the python command to use for running hererocks
        },
    }

    -- if not in_headless then
    --   vim.cmd [[autocmd User PackerComplete lua require('lvim.utils.hooks').run_on_packer_complete()]]
    -- end
end

function plugin_loader.load(plugins)
    -- Log:debug "loading plugins configuration"
    local packer_available, packer = pcall(require, "packer")
    if not packer_available then
        -- Log:warn "skipping loading plugins until Packer is installed"
        return
    end

    local status_ok, _ = xpcall(function()
        packer.startup(function(use)
            -- for _, plugins in ipairs(configurations) do
            for _, plugin in ipairs(plugins) do
                use(plugin)
            end
            -- end
        end)
    end, debug.traceback)

    -- if not status_ok then
    --     Log:warn "problems detected while loading plugins' configurations"
    --     Log:trace(debug.traceback())
    -- end
end


return plugin_loader
