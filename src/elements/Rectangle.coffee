class Rectangle extends PIXI.Graphics
    color: null
    posX: null
    posY: null
    w: null
    h: null
    p: null
    Bad: false
    Value: null
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
        @Bad = Bad
        @draw() 

    draw: =>

        @beginFill(@color)
        @drawRect(0 ,0 ,@w,@h)
        @endFill()

#    animate: =>
#        return if @pause
#        @x -= 3
#        if @x <= 0
#            @x = window.innerWidth

#    collision: =>
#        dx = @x - @green.x
#        dy = @y - @green.y
#        distance = Math.sqrt(green.x < n.x + n.width && green.x + green.width > n.x && green.y < n.y + n.height && green.height + green.y > n.y)

#        if distance < @y + @green.x
#            @green.alpha = 0


module.exports = Rectangle