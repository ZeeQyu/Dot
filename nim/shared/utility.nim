import jsffi

proc consoleLog*() {.varargs, importc:"console.log".}

proc jsSocketEmit*(id: cstring, data: JsObject,
  callback: proc(err: JsObject, data: JsObject)) {.importc.}

proc jsAddSprite(x, y: int, textureName: cstring) : JsObject {.importc.}
proc createSprite*(textureName: cstring): JsObject =
  result = jsAddSprite(0, 0, textureName)
  result.anchor.setTo(0.5)

# var phaserGame* {.importc:"game".} : JsObject
# var phaserGameAdd* {.importc:"game.add".} : JsObject
# proc phaserGameAddTileSprite*(x, y, width, height: int, texture: cstring) : JsObject {.importc:"game.add.tileSprite".}

# proc phaserLoadImage*(name, path: cstring) {.importc:"game.load.image".}

proc throw*(errorText: cstring) =
  var error {.exportc.} = errorText
  {.emit: "throw error;".}
