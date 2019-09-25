when not defined(js):
  {.fatal: "This file can only be compiled with js backend ('nim js client.nim')".}

import jsffi
import clientGame
import ../shared/utility

var socketCluster {.importc.} : JsObject
var scCodecMinBin {.importc.} : JsObject

var window {.importc.} : JsObject
var Phaser {.importc.} : JsObject

proc newPhaserGame() : JsObject {.varargs, importc:"new Phaser.Game".}
var game {.exportc.} : JsObject

proc onConnect() =
  consoleLog("Connected")

proc onSubscribeFail(err: JsObject) = 
  consoleLog("Failed to subscribe to the channel due to error: " & err.to(cstring))

proc onSampleChannel(num: JsObject) =
  consoleLog("Sample channel message: " & num.to(cstring))

proc onRandomMessage(data: JsObject) = 
  consoleLog("Random stream: " & data.rand.to(cstring))

window.onload = proc() =
  var gameFunctions = JsObject{}
  gameFunctions.preload = clientGame.preloadGame
  gameFunctions.create = clientGame.createGame
  gameFunctions.render = clientGame.renderGame
  gameFunctions.update = clientGame.updateGame
  game = newPhaserGame("100", "100", Phaser.AUTO, "", gameFunctions)
  
  var socket = socketCluster.connect()
  socket.on("error", utility.throw)
  socket.on("connect", onConnect)
  socket.on("rand", onRandomMessage)

  var sampleChannel = socket.subscribe("sample")
  sampleChannel.on("subscribeFail", onSubscribeFail)
  sampleChannel.watch(onSampleChannel)
