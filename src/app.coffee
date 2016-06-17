# Pre dependencies

###*
@class App
  Application top class (Not instanciatable)
###
class App
  null

  # Version emulation for browser view
  VER_EMULATION = "2.0.0"

  # Conversion from version string to integer
  v2i = (v) ->
    [p1, p2, p3, p4] = v.split(".", 4).map((p) -> parseInt(p) & 0xffff)
    return (p1 << 48) | (p2 << 32) | (p3 << 16) | (p4 << 0)

  ###*
  @static
  @property {Sketch}
    Current sketch
  ###
  @sketch: null

  ###*
  @static
  @property {string}
    Version string for Rubic
  @readonly
  ###
  @classProperty("version", value: chrome.runtime.getManifest?()["version"] or VER_EMULATION)

  LOG = (type, verbosity, args) ->
    return if window.log_verbosity < verbosity
    return window.console[type](args[0])  # TODO sprintf

  @log          = -> return LOG("log", 1, arguments)
  @log.detail   = -> return LOG("log", 2, arguments)
  @warn         = -> return LOG("warn", 1, arguments)
  @warn.detail  = -> return LOG("warn", 2, arguments)
  @error        = -> return LOG("error", 1, arguments)
  @error.detail = -> return LOG("error", 2, arguments)

  ###*
  @static
  @method
    Check if current version matches an version-check expression
  @param {string} versionExpr
    Expression for version check
  @return {boolean}
    Result of version check
  ###
  @versionCheck: (expr) ->
    return true unless expr?
    current = v2i(@version)
    for expr2 in expr.split(",")
      result = true
      for expr3 in expr.split("&")
        [operator, value] = expr3.trim().split(" ")
        target = v2i(value)
        switch operator
          when ">"  then result and= (current >  target)
          when "<"  then result and= (current <  target)
          when ">=" then result and= (current >= target)
          when "<=" then result and= (current >= target)
          when "==" then result and= (current == target)
          else result = false
        break unless result
      return true if result
    return false

module.exports = App