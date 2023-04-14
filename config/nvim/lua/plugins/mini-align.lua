return {
  "echasnovski/mini.align",
  enabled = false,
  keys = {
    "ga",
    "gA",
    { "ga", mode = "v" },
    { "gA", mode = "v" },
  },
  config = function ()
    require("mini.align").setup({})
  end,
}
