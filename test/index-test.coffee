should = require "should"
detekt = require ".."

describe "Detekt", ->

  UA =
    iphone:  "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_3_3 like Mac OS X; ja-jp) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"
    android: "Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"
    wp:      "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)"
    ipad:    "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25"
    desktop: "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36"

  describe " => isTouchSupported", ->

    it " should be true for iPhone", ->
      detekt.isTouchSupported(UA.iphone).should.be.true
    it " should be true for android", ->
      detekt.isTouchSupported(UA.android).should.be.true
    it.only " should be true for windows phones", ->
      detekt.isTouchSupported(UA.wp).should.be.true
    it " should be false for iPad", ->
      detekt.isTouchSupported(UA.ipad).should.be.false
    it " should be false for desktop", ->
      detekt.isTouchSupported(UA.desktop).should.be.false