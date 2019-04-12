class Bomb extends PIXI.Graphics

    constructor: (r, app) ->
        super()
        @app = app
        @r = r
        @build()

    build: =>
        @beginFill(0x999966)
        @drawCircle(0, 0, @r)
        @endFill()

    animate: =>
        if @y <= 0
            @app.garbageCollector(@)
        @y -= 3


module.exports = Bomb