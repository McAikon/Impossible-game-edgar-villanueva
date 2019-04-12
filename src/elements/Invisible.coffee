class Invisible extends PIXI.Graphics


    constructor:(inv, app) ->
        super()
        @data = inv
        @app = app
        console.log 'new inv'
        @beginFill(@data.c, @data.alpha)
        @drawRect(0 ,0 ,@data.w,@data.h, @alpha)
        @x = @data.x
        @y = @data.y
        @endFill()

module.exports = Invisible