class Invisible2 extends PIXI.Graphics

    constructor:(inv2, app) ->
        super()
        @data = inv2
        @app = app
        console.log 'new inv2'
        @beginFill(@data.c, @data.alpha)
        @drawRect(0 ,0 ,@data.w,@data.h, @alpha)
        @x = @data.x
        @y = @data.y
        @endFill()

module.exports = Invisible2