local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("config.options")(config)
require("config.keys")(config)
require("config.launch_menu")(config)
require("config.status")
require("config.startup")
--
-- require("config.plugins.resurrect.config")

return config
