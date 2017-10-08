import utility

proc preloadGame*() =
  # var game {.importc.} : JsObject
  # game.debug.text("Hello World!")
  phaserLoadImage("background", "img/background-texture.png")


proc createGame*() =
  var background = phaserGameAddTileSprite(0, 0, 4000, 4000, "background")
  discard

proc renderGame*() =
  discard

proc updateGame*() = 
  utility.consoleLog("Running")
  discard

type
  Textures* = object of RootObj
    left: cstring
    right: cstring
    up: cstring
    down: cstring

  GameConstants* = object of RootObj
    youTextures: Textures

