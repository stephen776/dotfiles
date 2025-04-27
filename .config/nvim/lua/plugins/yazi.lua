-- not installed yet!
if true then
  return {}
end

return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "-",
      function()
        require("yazi").yazi()
      end,
      desc = "Open yazi at the current file",
    },
    {
      "<leader>yy",
      function()
        require("yazi").yazi()
      end,
      desc = "Open yazi at nvim cwd",
    },
    -- {
    --   "<leader>e",
    --   function()
    --     require("yazi").yazi()
    --   end,
    --   desc = "Open yazi at the current file",
    -- },
    -- {
    --   -- Open in the current working directory
    --   "<leader>E",
    --   function()
    --     require("yazi").yazi(nil, vim.fn.getcwd())
    --   end,
    --   desc = "Open the file manager in nvim cwd",
    -- },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = false,
  },
}
