should = require "should"
detekt = require ".."

describe "Detekt", ->

  UA =
    iphone:  "Mozilla/5.0 (iPhone; U; fr; CPU iPhone OS 4_2_1 like Mac OS X; fr) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148a Safari/6533.18.5"
    ipod:    "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_3_3 like Mac OS X; ja-jp) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"
    android: "Mozilla/5.0 (Linux; Android 4.2.1; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    wp:      "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)"
    ipad:    "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25"
    desktop: "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36"
    S3:      "Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; Samsung Galaxy S3) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"
    nexus7:  "Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 7 Build/JOP12D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30"
    nexus10: "Mozilla/5.0 (Linux; U; Android 4.2; en-us; Nexus 10 Build/JOP12D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30"


  describe " => isTouchSupported", ->

    it " should be true for iPhone", ->
      detekt.isTouchSupported(UA.iphone).should.be.true

    it " should be true for android", ->
      detekt.isTouchSupported(UA.android).should.be.true

    it " should be true for windows phones", ->
      detekt.isTouchSupported(UA.wp).should.be.true

    it " should be false for iPad", ->
      detekt.isTouchSupported(UA.ipad).should.be.false

    it " should be false for desktop", ->
      detekt.isTouchSupported(UA.desktop).should.be.false

  describe " => isPlatform", ->

    it "should check if platform is iOS", ->
      detekt.isPlatform(UA.iphone, "iOS").should.be.true
      detekt.isPlatform(UA.ipad, "iOS").should.be.true

    it "should check if platform is Android", ->
      detekt.isPlatform(UA.android, "Android").should.be.true

    it "should check if platform is WindowsPhone", ->
      detekt.isPlatform(UA.wp, "Windows Phone").should.be.true

    it "should return correct result if the passed in platform has wrong casing", ->
      detekt.isPlatform(UA.iphone, "ios").should.be.true
      detekt.isPlatform(UA.android, "android").should.be.true

  describe " => isiOS", ->

    it "should be true for iphone, ipad and ipod", ->
      detekt.isiOS(UA.iphone).should.be.true
      detekt.isiOS(UA.ipod).should.be.true
      detekt.isiOS(UA.ipad).should.be.true

  describe " => isAndroid", ->
    it "should be true for nexus 4", ->
      detekt.isAndroid(UA.android).should.be.true

  describe " =>  isWindowsPhone", ->
    it "should be true for Nokia lumia 920", ->
      detekt.isWindowsPhone(UA.wp)

  describe ' => isDevice', ->
    it 'should check iDevices', ->
      detekt.isDevice(UA.ipad, "iPad").should.be.true
      detekt.isDevice(UA.ipod , "iPod").should.be.true
      detekt.isDevice(UA.iphone, "iPhone").should.be.true

    it 'should check for popular android devices', ->
      nexus = UA.android;
      detekt.isDevice(nexus, "Nexus").should.be.true

  describe ' => isMobile', ->

    it 'should be true for iPhone and iPods',  ->
      detekt.isMobile(UA.iphone).should.be.true
      detekt.isMobile(UA.ipod).should.be.true

    it 'should be false for iPads', ->
      detekt.isMobile(UA.ipad).should.be.false

  describe ' => isTablet', ->
    it 'should be true for iPads', ->
      detekt.isTablet(UA.ipad).should.be.true

    it 'should be true for nexus 7 and 10', ->
      detekt.isTablet(UA.nexus7).should.be.true
      detekt.isTablet(UA.nexus10).should.be.true
