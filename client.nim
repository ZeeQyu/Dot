when not defined(js):
  {.fatal: "This file can only be compiled with js backend ('nim js client.nim')".}


# type
#   Socket = ref object of RootObj
#     state {.exportc.} : string

# var socket {.exportc.} : Socket
# {.emit: "socket = socketCluster.connect({codecEngine: scCodecMinBin});\n".}
# if socket.state == "open":
#   echo "open"

# proc onLoad() {.exportc, used.} =
#   var game, playerId, player : int

# if false:
#   onLoad() # Without this, the onLoad function is not generated in js
#   {.emit: "window.onload = onLoad".}

import jsffi

var socketCluster {.importc.} : JsObject
var scCodecMinBin {.importc.} : JsObject
socketCluster.connect(JsObject{"codecEngine": scCodecMinBin})

var window {.importc.} : JsObject
var Phaser {.importc.} : JsObject

proc preloadGame()
proc createGame()
proc renderGame()
proc updateGame()
proc consoleLog() {.varargs, importc:"console.log".}

proc PhaserGame() : JsObject {.varargs, importc:"new Phaser.Game".}
var game {.exportc.} : JsObject

window.onload = proc() =
  var gameFunctions = JsObject{}
  gameFunctions.preload = preloadGame
  gameFunctions.create = createGame
  gameFunctions.render = renderGame
  gameFunctions.update = updateGame
  game = PhaserGame("100", "100", Phaser.AUTO, "", gameFunctions)
  
proc preloadGame() =
  # var game {.importc.} : JsObject
  # game.debug.text("Hello World!")
  discard
proc createGame() =
  discard
proc renderGame() =
  discard
proc updateGame() = 
  consoleLog("Running")
  discard