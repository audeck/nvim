return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "ray-x/lsp_signature.nvim",

    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local lsp_zero = require("lsp-zero")
        local telescope = require("telescope.builtin")

        lsp_zero.preset("recommended")
        lsp_zero.set_preferences({ set_lsp_keymaps = false })

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            -- LSP
            local definitions = function() telescope.lsp_definitions() end
            local declarations = function() vim.lsp.buf.declaration() end
            local references = function() telescope.lsp_references() end
            local implementations = function() telescope.lsp_implementations() end
            local inspect_type = function() vim.lsp.buf.hover() end
            local code_actions = function() vim.lsp.buf.code_action() end

            vim.keymap.set("n", "<leader>ld", definitions, opts)
            vim.keymap.set("n", "<leader>lD", declarations, opts)
            vim.keymap.set("n", "<leader>lr", references, opts)
            vim.keymap.set("n", "<leader>li", implementations, opts)
            vim.keymap.set("n", "<leader>lt", inspect_type, opts)
            vim.keymap.set("n", "<leader>la", code_actions, opts)

            -- DIAGNOSTICS
            local diagnostics_show = function() vim.diagnostic.open_float() end
            local diagnostics_all = function() telescope.diagnostics() end
            local diagnostics_file = function() telescope.diagnostics({ bufnr = bufnr }) end

            vim.keymap.set("n", "<leader>da", diagnostics_all, opts)
            vim.keymap.set("n", "<leader>df", diagnostics_file, opts)
            vim.keymap.set("n", "<leader>ds", diagnostics_show, opts)

            -- which-key
            require("which-key").register({
                ["<leader>"] = {
                    l = {
                        name = "[l]sp",
                        d = { "Go to [d]efinition(s)" },
                        D = { "Go to [D]eclaration(s)" },
                        i = { "Go to [i]mplementation(s)" },
                        r = { "Go to [r]eference(s)" },
                        t = { "Inspect [t]ype(s)" },
                        a = { "Inspect code [a]ction(s)" }
                    },
                    d = {
                        name = "[d]iagnostics",
                        s = { "Show [s]elected" },
                        f = { "Show in [f]ile" },
                        a = { "Show [a]ll in project" }
                    }
                }
            }, { mode = "n" })
        end)

        require("fidget").setup({})

        require("mason").setup({
            ui = {
                keymaps = {
                    install_package = "<CR>",
                    cancel_installation = "<C-c>",
                    uninstall_package = "d",

                    update_package = "<CR>",
                    update_all_packages = "<C-CR>",

                    check_package_version = "v",
                    check_outdated_packages = "V",

                    toggle_package_expand = "l",
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            handlers = { lsp_zero.default_setup },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For `luasnip` users.
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local lspconfig = require("lspconfig")

        lspconfig.gdscript.setup({
            cmd = {
                "/home/audeck/dev/godot-wsl-lsp/bin/godot-wsl-lsp",
                "--useMirroredNetworking"
            },
        })

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're
                        -- using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized,
                    -- but unique nonetheless, identifier
                    telemetry = {
                        enable = false,
                    },
                    format = {
                        enable = true,
                    },
                },
            },
        })

        lsp_zero.setup()

        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                -- border = "rounded",
            },
            hint_enable = false,
        })
    end
}
