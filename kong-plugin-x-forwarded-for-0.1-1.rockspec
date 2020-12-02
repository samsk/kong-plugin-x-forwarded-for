package = "kong-plugin-x-forwarded-for"
version = "0.1-1"
source = {
   url = "https://github.com/samsk/kong-plugin-x-forwarded-for",
   tag = "v0.1"
}
description = {
   summary = "A Kong plugin to modify X-Forwarded-For header value",
   homepage = "https://github.com/samsk/kong-plugin-x-forwarded-for",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.ip-auth.handler"] = "handler.lua",
      ["kong.plugins.ip-auth.schema"] = "schema.lua"
   }
}
