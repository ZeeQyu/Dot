import ../shared/utility
import jsffi

var game {.importc.} : JsObject

proc preloadGame*() =
  # var game {.importc.} : JsObject
  # game.debug.text("Hello World!")
  game.load.image("background", "img/background-texture.png")


proc createGame*() =
  discard game.add.tileSprite(0, 0, 4000, 4000, "background")

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

