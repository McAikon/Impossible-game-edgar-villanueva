class Bullet extends PIXI.Graphics

    constructor: (r, app) ->
        super()
        @app = app
        @r = r
        @build()

    build: =>
        @beginFill(0xfff000)
        @drawCircle(0, 0, @r)
        @endFill()

    animate: =>
        if @y <= 0
            @app.garbageCollector(@)
        @y -= 15


module.exports = Bullet