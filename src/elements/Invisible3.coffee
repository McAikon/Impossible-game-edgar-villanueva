class Invisible3 extends PIXI.Graphics

    constructor:(inv3, app) ->
        super()
        @data = inv3
        @app = app
        console.log 'new inv3'
        @beginFill(@data.c, @data.alpha)
        @drawRect(0 ,0 ,@data.w,@data.h, @alpha)
        @x = @data.x
        @y = @data.y
        @endFill()

module.exports = Invisible3