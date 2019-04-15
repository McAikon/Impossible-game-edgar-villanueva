class Lanza extends PIXI.Graphics

    alpha: 1
    velocidad : 0

    constructor:(la,app) ->
        super()
        @data = la
        @app = app
        @x = @data.x
        @y = @data.y
        @alpha = 0

    animate: =>
        @y += @velocidad



module.exports = Lanza