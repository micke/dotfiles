return {
  "EdenEast/nightfox.nvim",
  dev = true,
  lazy = false,
  priority = 999,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function ()
    require("nightfox").setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "bold"
        },
      },
      groups = {
        all = {
          ["@symbol"] = { link = "Identifier" }
        },
      },
    })

    vim.cmd("colorscheme hybridfox")

    vim.o.winbar = "%{%v:lua.require'winbar'.get_winbar()%}"

    local colors = require("nightfox.palette").load("hybridfox")

    require "nvim-web-devicons".setup {
      override = {
        html = {
          icon = "",
          color = colors.pink.bright,
          name = "html"
        },
        css = {
          icon = "",
          color = colors.blue.base,
          name = "css"
        },
        js = {
          icon = "",
          color = colors.yellow.dim,
          name = "js"
        },
        ts = {
          icon = "ﯤ",
          color = colors.blue.bright,
          name = "ts"
        },
        kt = {
          icon = "󱈙",
          color = colors.orange.base,
          name = "kt"
        },
        png = {
          icon = "",
          color = colors.magenta.dark,
          name = "png"
        },
        jpg = {
          icon = "",
          color = colors.magenta.dark,
          name = "jpg"
        },
        jpeg = {
          icon = "",
          color = colors.magenta.dark,
          name = "jpeg"
        },
        mp3 = {
          icon = "",
          color = colors.white.base,
          name = "mp3"
        },
        mp4 = {
          icon = "",
          color = colors.white.base,
          name = "mp4"
        },
        out = {
          icon = "",
          color = colors.white.base,
          name = "out"
        },
        Dockerfile = {
          icon = "",
          color = colors.cyan.base,
          name = "Dockerfile"
        },
        rb = {
          icon = "",
          color = colors.red.dim,
          name = "rb"
        },
        vue = {
          icon = "﵂",
          color = colors.green.bright,
          name = "vue"
        },
        py = {
          icon = "",
          color = colors.cyan.base,
          name = "py"
        },
        toml = {
          icon = "",
          color = colors.blue.base,
          name = "toml"
        },
        lock = {
          icon = "",
          color = colors.red.base,
          name = "lock"
        },
        zip = {
          icon = "",
          color = colors.yellow.base,
          name = "zip"
        },
        xz = {
          icon = "",
          color = colors.yellow.base,
          name = "xz"
        },
        deb = {
          icon = "",
          color = colors.cyan.base,
          name = "deb"
        },
        rpm = {
          icon = "",
          color = colors.orange.base,
          name = "rpm"
        }
      }
    }
  end,
}
