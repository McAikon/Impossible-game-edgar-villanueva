class Rectangle extends PIXI.Graphics

    bombCount: 10
    color: null
    posX: null
    posY: null
    w: null
    h: null

    constructor: (c, x, y, w, h) ->
        super()
        @color = c
        @posX = x
        @posY = y
        @w = w
        @h = h
        @draw()

    draw: () =>
        @beginFill(@color)
        @drawRect(@posX, @posY, @w, @h)
        @endFill()

    animate: () =>
        null

module.exports = Rectangle
