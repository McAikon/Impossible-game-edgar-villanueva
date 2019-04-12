class Rectangule extends PIXI.Graphics
    color: null
    posX: null
    posY: null
    w: null
    h: null
#    pause: false
#    p: null
#    Bad: false
#    Value: null

    constructor:(c, x, y, w, h, p, Bad) ->
        super()
        @color = c
        @PosX = x
        @PosY = y
        @w = w
        @h = h
        @p = p
        @Bad = Bad
        @beginFill(@color)
        @drawRect(@PosX,@PosY,@w,@h)
        @endFill()

    animate: =>
      return if @pause
      @x += 1

module.exports = Rectangule