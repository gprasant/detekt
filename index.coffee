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

detekt =
  isTouchSupported: (userAgent) ->
    ua = userAgent


    _isIEMobile() ||
    !_isIpad() &&
    _isWebKit() &&
    _isMobile()

module.exports = detekt