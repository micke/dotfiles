local colors = require("nightfox.colors").init()

require "nvim-web-devicons".setup {
  override = {
    html = {
      icon = "",
      color = colors.pink_br,
      name = "html"
    },
    css = {
      icon = "",
      color = colors.blue,
      name = "css"
    },
    js = {
      icon = "",
      color = colors.yellow_dm,
      name = "js"
    },
    ts = {
      icon = "ﯤ",
      color = colors.blue_br,
      name = "ts"
    },
    kt = {
      icon = "󱈙",
      color = colors.orange,
      name = "kt"
    },
    png = {
      icon = "",
      color = colors.dark_purple,
      name = "png"
    },
    jpg = {
      icon = "",
      color = colors.dark_purple,
      name = "jpg"
    },
    jpeg = {
      icon = "",
      color = "colors.dark_purple",
      name = "jpeg"
    },
    mp3 = {
      icon = "",
      color = colors.white,
      name = "mp3"
    },
    mp4 = {
      icon = "",
      color = colors.white,
      name = "mp4"
    },
    out = {
      icon = "",
      color = colors.white,
      name = "out"
    },
    Dockerfile = {
      icon = "",
      color = colors.cyan,
      name = "Dockerfile"
    },
    rb = {
      icon = "",
      color = colors.red_dm,
      name = "rb"
    },
    vue = {
      icon = "﵂",
      color = colors.green_br,
      name = "vue"
    },
    py = {
      icon = "",
      color = colors.cyan,
      name = "py"
    },
    toml = {
      icon = "",
      color = colors.blue,
      name = "toml"
    },
    lock = {
      icon = "",
      color = colors.red,
      name = "lock"
    },
    zip = {
      icon = "",
      color = colors.sun,
      name = "zip"
    },
    xz = {
      icon = "",
      color = colors.sun,
      name = "xz"
    },
    deb = {
      icon = "",
      color = colors.cyan,
      name = "deb"
    },
    rpm = {
      icon = "",
      color = colors.orange,
      name = "rpm"
    }
  }
}
