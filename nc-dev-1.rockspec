package = "NC"
version = "dev-1"
source = {
   url = "git+https://github.com/LibreEngineer/NC.lua"
}
dependencies = {
  "lua >= 5.4"
}
description = {
   homepage = "https://github.com/LibreEngineer/NC.lua",
   license = "WTFPL"
}
build = {
   type = "builtin",
   modules = {
      ["NC.init"] = "NC/init.lua",
      ["NC.mill.haas_chc"] = "NC/mill/haas_chc.lua",
      ["NC.mill.haas_ngc"] = "NC/mill/haas_ngc.lua",
      ["NC.mill.linuxcnc"] = "NC/mill/linuxcnc.lua",
   }
}
