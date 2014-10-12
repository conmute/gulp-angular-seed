GLOBAL.fn =

  pushSrc: (arr, name) ->
    if GLOBAL.seperateDist[name]
      arr.push GLOBAL.distPath[name] + "*.js"
    else
      arr.push GLOBAL.distPath[name] + GLOBAL.fileName[name]
    return

  getSrc: (name) ->
    if GLOBAL.seperateDist[name]
      GLOBAL.distPath[name] + "*.js"
    else
      GLOBAL.distPath[name] + GLOBAL.fileName[name]