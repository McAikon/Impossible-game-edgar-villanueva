mathjs = require("mathjs")

class Enemy extends PIXI.Graphics

    color: null
    posX: null
    posY: null
    r: null
    enemy: null

    constructor: (x, y, r, c, nave, app) ->
        super()
        @app = app
        @nave = nave
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
        if @y >= window.innerHeight
            @app.garbageCollector(@)
        @x += mathjs.randomInt(0, 3)

    collision: () ->
        dx = @x - @nave.x
        dy = @y - @nave.y
        distance = Math.sqrt(dx * dx + dy * dy)

        if distance < @r + @nave.r
            @nave.alpha = 0

module.exports = Enemy