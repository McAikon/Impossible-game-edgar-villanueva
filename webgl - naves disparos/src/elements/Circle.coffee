class Circle extends PIXI.Graphics

    bombCount: 10
    color: null
    posX: null
    posY: null
    r: null

    constructor: (x, y, r, c) ->
        super()
        @color = c
        @posX = x
        @posY = y
        @r = r
        @draw()

    draw: () =>
        @beginFill(@color)
        @drawCircle(@posX, @posY, @r, @c)
        @endFill()

    animate: =>
        null

module.exports = Circle