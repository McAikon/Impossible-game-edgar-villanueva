mathjs = require 'mathjs'

class Power extends PIXI.Graphics
    constructor: (type)->
        super()
        @type = type
        @y = 0
        @x = mathjs.randomInt(0,window.innerWidth)
        
        @build()

    build: () =>
        console.log @type
        switch @type
            when 'life'
                @beginFill(0x2efe2e)
                @drawRect(0, 0, 25, 25)
                @endFill()
            when 'weapon'
                @beginFill(0xffffff)
                @drawRect(0, 0, 30, 30)
                @endFill()
    animate: ()=>
        @y += 3

module.exports = Power