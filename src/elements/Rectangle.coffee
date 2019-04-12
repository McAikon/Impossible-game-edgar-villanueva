Paredes = require('../data/paredes')

class Rectangle extends PIXI.Graphics
    color: null
    posX: null
    posY: null
    w: null
    h: null
    p: null
    Bad: false
    alpha: 1
    paredes : Paredes
    velocidad : 0
    pause: null
    constructor:(c, x, y, w, h, p, Bad) ->
        super()
        @color = c
        @PosX = x
        @PosY = y
        @pause = false
        @w = w
        @h = h
        @p = p
        @x = x
        @y = y
        @Bad = Bad
        @draw() 

    draw: =>

        @beginFill(@color)
        @drawRect(0 ,0 ,@w,@h, @alpha, @paredes)
        @endFill()
        @alpha = 1

    animate: =>
        @y += @velocidad



module.exports = Rectangle