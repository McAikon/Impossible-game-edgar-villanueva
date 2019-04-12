class Pared extends PIXI.Graphics

    alpha: 1

    constructor:(p, app) ->
        super()
        @data = p
        @app = app
        @beginFill(@data.c)
        @drawRect(0 ,0 ,@data.w,@data.h, @alpha)
        @x = @data.x
        @y = @data.y
        @alpha = 0
        @endFill()

module.exports = Pared