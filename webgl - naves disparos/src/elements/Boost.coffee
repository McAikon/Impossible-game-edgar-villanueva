mathjs = require("mathjs")

class Boost extends PIXI.Graphics

    constructor: (type) ->
        super()
        @type = type
        @y = 0
        @x = mathjs.randomInt(0, window.innerWidth)
        @build()

    build: =>
        switch @type
            when 'life'
                @beginFill(0x00fff0)
                @drawRect(0, 0, 10, 10)
                @endFill()
            when 'weapon'
                @beginFill(0x00ff00)
                @drawRect(0, 0, 15, 15)
                @endFill()

    animate: () =>
        @y += 1

module.exports = Boost