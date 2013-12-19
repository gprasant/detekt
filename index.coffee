parser = require('ua-parser')
{contains} = require("underscore")
ua = null

_isIpad = ->
  /iPad/.test(parser.parseDevice(ua).toString())

_isMobile = ->
  /Mobile\b/.test ua

_isWebKit = ->
  /\bAppleWebKit\b/.test ua

_isIEMobile = ->
  /IE Mobile/.test parser.parseUA(ua).toString()

_isAndroidTab = ->
  /Android.*AppleWebKit.*(?!Mobile)/.test ua

detekt =
  isTouchSupported: (userAgent) ->
    ua = userAgent

    _isIEMobile() ||
    !_isIpad() &&
    _isWebKit() &&
    _isMobile()

  isPlatform: (userAgent, platform) ->
    re = new RegExp platform, "i"
    re.test parser.parseOS(userAgent)

  isiOS: (userAgent) ->
    @isPlatform(userAgent, "iOS")

  isAndroid: (userAgent) ->
    @isPlatform(userAgent, "Android")

  isWindowsPhone: (userAgent) ->
    @isPlatform(userAgent, "Windows Phone")

  isDevice: (userAgent, device) ->
    re = new RegExp(device, "i")
    re.test(parser.parseDevice(userAgent).toString())

  isMobile: (userAgent) ->
    ua = userAgent
    _isMobile() && !_isIpad()

  isTablet: (userAgent) ->
    ua = userAgent
    _isIpad() || _isAndroidTab()
module.exports = detekt