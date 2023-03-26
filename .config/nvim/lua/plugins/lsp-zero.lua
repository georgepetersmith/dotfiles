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
    {'saadparwaiz1/cmp_luasnip'},        -- Optional
    {'hrsh7th/cmp-nvim-lua'},            -- Optional
    {'jose-elias-alvarez/null-ls.nvim'}, -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero')
    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})

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

    local lspconfig = require('lspconfig')
    -- (Optional) Configure lua language server for neovim
    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

    lspconfig.omnisharp.setup {
      cmd = { "dotnet", "/Users/george/.omnisharp/OmniSharp.dll", "--languageserver" },

      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      enable_editorconfig_support = true,

      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      enable_ms_build_load_projects_on_demand = false,

      -- Enables support for roslyn analyzers, code fixes and rulesets.
      enable_roslyn_analyzers = false,

      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      organize_imports_on_format = false,

      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      enable_import_completion = false,

      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      sdk_include_prereleases = true,

      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      analyze_open_documents_only = false,
    }

    lsp.setup()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
      },
      mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      }
    })

  end
}