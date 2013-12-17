parser = require('ua-parser')
{contains} = require("underscore")

_blacklistedDevices = ["iPad", "Other"]
#_whitelistedDevices = ["iphone", "android", "windows phone"]

_blacklisted = (ua) ->
  contains(_blacklistedDevices, parser.parseDevice(ua).toString())

detekt =
  isTouchSupported: (userAgent) ->
    !_blacklisted(userAgent) #&& _whitelisted(userAgent)

module.exports = detekt