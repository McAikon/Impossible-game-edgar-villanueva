class Picos extends PIXI.Graphics

    alpha: 1

    constructor:(pi,app) ->
        super()
        @data = pi
        @app = app
        @x = @data.x
        @y = @data.y
        @alpha = 0



module.exports = Picos