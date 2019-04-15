class Invisible4 extends PIXI.Graphics

    constructor:(inv4, app) ->
        super()
        @data = inv4
        @app = app
        console.log 'new inv4'
        @beginFill(@data.c, @data.alpha)
        @drawRect(0 ,0 ,@data.w,@data.h, @alpha)
        @x = @data.x
        @y = @data.y
        @endFill()

module.exports = Invisible4