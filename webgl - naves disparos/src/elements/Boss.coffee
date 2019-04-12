mathjs = require("mathjs")

class Boss extends PIXI.Graphics

    constructor: (r, nave, app) ->
        super()
        @app = app
        @r = r
        @build()

    build: =>
        @beginFill(0xff0040)
        @drawCircle(0, 0, @r)
        @endFill()

    animate: =>
        if @y >= window.innerHeight
            @app.garbageCollector(@)

    collision: () ->
        dx = @x - @nave.x
        dy = @y - @nave.y
        distance = Math.sqrt(dx * dx + dy * dy)

        if distance < @r + @nave.r
            @nave.alpha = 0

module.exports = Boss