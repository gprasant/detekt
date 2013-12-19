detekt
===

[![Build Status](https://ci.groupondev.com/job/detekt/badge/icon)](https://ci.groupondev.com/job/detekt/)

## Available methods

  * isTouchSupported
  * [isPlatform](#isPlatform)
    - isiOS
    - isAndroid
    - isWindowsPhone
  * isDevice
  * isMobile
  * isTablet

In the following code snippets, ua can be supplied with either navigator.userAgent(client) or req.headers['User-Agent'](server).

## Usage

```
  detekt = require "detekt"
  detekt.isTouchSupported(ua)
```

## isTouchSupported

```
  detekt.isTouchSupported(ua) #true for appleWebkit and mobile browsers(except ipad)
```

## isPlatform

```
  detekt.isPlatform(ua, "iOS") # true for iOS devices
```

## isiOS | isAndroid | isWindowsPhone

Sugar for `isPlatform(ua,"iOS | Android | Windows Phone")`

```
  detekt.isiOS(ua)
```

## isDevice

```
  detekt.isDevice(ua, "iPad")
  detekt.isDevice(ua, "iPhone")
  detekt.isDevice(ua, "Nexus")
```

## isMobile
True for mobile devices. False otherwise.

```
  detekt.isMobile(ua) # true for iphone , ipod . false for ipad & tablets
```

## isTablet
True for Tablet devices. false otherwise.

```
  detekt.isTablet(ua) # true for iPad, nexus 7/10 ...
```