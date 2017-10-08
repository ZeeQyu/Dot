when not defined(js):
  {.fatal: "This file can only be compiled with js backend ('nim js client.nim')".}

import jsffi
import clientGame
import ../shared/utility

var socketCluster {.importc.} : JsObject
var scCodecMinBin {.importc.} : JsObject
# socketCluster.connect(JsObject{"codecEngine": scCodecMinBin})

var window {.importc.} : JsObject
var Phaser {.importc.} : JsObject

proc PhaserGame() : JsObject {.varargs, importc:"new Phaser.Game".}
var game {.exportc.} : JsObject

window.onload = proc() =
  var gameFunctions = JsObject{}
  gameFunctions.preload = clientGame.preloadGame
  gameFunctions.create = clientGame.createGame
  gameFunctions.render = clientGame.renderGame
  gameFunctions.update = clientGame.updateGame
  game = PhaserGame("100", "100", Phaser.AUTO, "", gameFunctions)
  
