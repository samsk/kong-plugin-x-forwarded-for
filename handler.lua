local constants = require "kong.constants"
local BasePlugin = require "kong.plugins.base_plugin"

local XForwardedForHandler = BasePlugin:extend()

XForwardedForHandler.PRIORITY = 99
XForwardedForHandler.VERSION = "0.1"

function XForwardedForHandler:access(conf)
	local trusted_ip = kong.ip.is_trusted(realip_remote_addr)
	if trusted_ip then
		-- default behavior is to pass upstream header (if IP trusted)
		ngx.var.upstream_x_forwarded_for = ngx.var.http_x_forwarded_for
	end
end

return XForwardedForHandler
