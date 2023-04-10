return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'j-hui/fidget.nvim', config = true},  -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},                -- Required
    {'hrsh7th/cmp-nvim-lsp'},            -- Required
    {'hrsh7th/cmp-buffer'},              -- Optional
    {'hrsh7th/cmp-path'},                -- Optional
    {'hrsh7th/cmp-nvim-lsp-signature-help'},                -- Optional
    {'saadparwaiz1/cmp_luasnip'},        -- Optional
    {'hrsh7th/cmp-nvim-lua'},            -- Optional
    {'jose-elias-alvarez/null-ls.nvim'}, -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()


    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>n", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

      --[[ There is currently a bug with Roslyn that is breaking the LSP contract and causing the following error:
      Error executing vim.schedule lua callbaack:
      /usr/share/[...]/semantic_tokens.lua:342:E5248: Invalid character in group name.
      https://nicolaiarocci.com/making-csharp-and-omnisharp-play-well-with-neovim/ ]]
      if client.name == "omnisharp" then
        client.server_capabilities.semanticTokensProvider = {
          full = vim.empty_dict(),
          legend = {
            tokenModifiers = { "static_symbol" },
            tokenTypes = {
              "comment",
              "excluded_code",
              "identifier",
              "keyword",
              "keyword_control",
              "number",
              "operator",
              "operator_overloaded",
              "preprocessor_keyword",
              "string",
              "whitespace",
              "text",
              "static_symbol",
              "preprocessor_text",
              "punctuation",
              "string_verbatim",
              "string_escape_character",
              "class_name",
              "delegate_name",
              "enum_name",
              "interface_name",
              "module_name",
              "struct_name",
              "type_parameter_name",
              "field_name",
              "enum_member_name",
              "constant_name",
              "local_name",
              "parameter_name",
              "method_name",
              "extension_method_name",
              "property_name",
              "event_name",
              "namespace_name",
              "label_name",
              "xml_doc_comment_attribute_name",
              "xml_doc_comment_attribute_quotes",
              "xml_doc_comment_attribute_value",
              "xml_doc_comment_cdata_section",
              "xml_doc_comment_comment",
              "xml_doc_comment_delimiter",
              "xml_doc_comment_entity_reference",
              "xml_doc_comment_name",
              "xml_doc_comment_processing_instruction",
              "xml_doc_comment_text",
              "xml_literal_attribute_name",
              "xml_literal_attribute_quotes",
              "xml_literal_attribute_value",
              "xml_literal_cdata_section",
              "xml_literal_comment",
              "xml_literal_delimiter",
              "xml_literal_embedded_expression",
              "xml_literal_entity_reference",
              "xml_literal_name",
              "xml_literal_processing_instruction",
              "xml_literal_text",
              "regex_comment",
              "regex_character_class",
              "regex_anchor",
              "regex_quantifier",
              "regex_grouping",
              "regex_alternation",
              "regex_text",
              "regex_self_escaped_character",
              "regex_other_escape",
            },
          },
          range = true,
        }
      end


    end)

    lsp.setup()

  end
}
