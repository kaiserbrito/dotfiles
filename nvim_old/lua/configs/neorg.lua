require("neorg").setup {
  load = {
    ["core.defaults"] = {},        -- Loads default behaviour
    ["core.concealer"] = {},       -- Adds pretty icons to your documents
    ["core.dirman"] = {            -- Manages Neorg workspaces
      config = {
        workspaces = {
          personal = "~/Documents/notes/personal",
          work = "~/Documents/notes/work",
        },
        default_workspace = "work",
      },
    },
  },
}
