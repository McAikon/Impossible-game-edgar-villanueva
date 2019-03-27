Circle = require("./elements/Circle")
DataCircle = require('./data/circles')
fdata = require('./assets/Jugador.json')
Jugador = require('./assets/Jugador.png')
dagaImage = require('./assets/daga.png')
BgImage = require('./assets/stage.png')
Bgcamino = require('./assets/camino.png')
Bglava = require('./assets/lava.png')
Jugador = require('./assets/Jugador.png')
stage = require('./elements/stage')
Rectangle = require("./elements/Rectangle")

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  pared:[]
  obstaculo:[]
  daga:[]
  pause: false
  myStage: stage
  constructor:(w,h,o)->
    super(w,h,o)
    window.addEventListener 'keydown', @onKeyPress
    window.addEventListener 'keyup', @onKeyUp
    document.body.appendChild @view

    @preload()

  onKeyPress: (evt) =>
    return if @pause is true
    if evt.key is 's'
      @anim.y += 12
      @frame.splice(0,25)
      for i in [1..4]
        @frame.push(PIXI.Texture.fromFrame("#{i}.png"))

    if evt.key is 'w'
      @anim.y -= 14
      @frame.splice(0,25)
      for i in [6..8]
        @frame.push(PIXI.Texture.fromFrame("#{i}.png"))
    
    if evt.key is 'a'
      @anim.x -= 14
      @frame.splice(0,25)
      for i in [9..10]
        @frame.push(PIXI.Texture.fromFrame("#{i}.png"))

    if evt.key is 'd'
      @anim.x += 14
      @frame.splice(0,25)
      for i in [13..14]
        @frame.push(PIXI.Texture.fromFrame("#{i}.png"))
        
        

  onKeyUp: (evt) =>
    if evt.key is 's'
      @frame.splice(0,25)
      for i in [5..7]
        @frame.push(PIXI.Texture.fromFrame("#{1}.png"))


    if evt.key is 'a'
      @frame.splice(0,25)
      for i in [5..7]
        @frame.push(PIXI.Texture.fromFrame("#{11}.png"))

    if evt.key is 'd'
      @frame.splice(0,25)
      for i in [5..7]
        @frame.push(PIXI.Texture.fromFrame("#{14}.png"))

    if evt.key is 'w'
      @frame.splice(0,25)
      for i in [5..7]
        @frame.push(PIXI.Texture.fromFrame("#{5}.png"))
        
      
  preload:=>
      PIXI.loader.add([fdata, BgImage, Bgcamino, Bglava, dagaImage]).load(@build)

    
  build:()=>
    Bg = new stage (BgImage)
    @daga = new stage (dagaImage)
    @stage.addChild Bg
    @stage.addChild @daga

    @daga.width = 50
    @daga.height = 70
    @daga.x =0
    @daga.y = 80
    @pared.push @daga
    
    @frame = []
    for i in [1...15] by 1
      node = PIXI.Texture.fromFrame("#{i}.png")
      @frame.push(node)
    @anim = new PIXI.extras.AnimatedSprite(@frame)

    @anim.x = 85
    @anim.y = 25
    @anim.anchor.set(0.5)
    @anim.scale.set(0.08)
    @anim.animationSpeed = 0.2
    @anim.play()
    @stage.addChild(@anim)

    @paredext = new Rectangle(0xffffff, 0, 0, 18, 380,100)
    @paredext.x = 36
    @paredext.y = 50
    @paredext.alpha = 0
    @stage.addChild @paredext
    @pared.push @paredext

    @paredext2 = new Rectangle(0xff0000, 0, 0, 262, 18,100)
    @paredext2.x = 38
    @paredext2.y = 420
    @paredext2.alpha = 0
    @stage.addChild @paredext2
    @pared.push @paredext2

    @paredext3 = new Rectangle(0xE1AF10, 0, 0, 18, 65,100)
    @paredext3.x = 280
    @paredext3.y = 420
    @paredext3.alpha = 0
    @stage.addChild @paredext3
    @pared.push @paredext3

    @paredext4 = new Rectangle(0x710813, 0, 0, 120, 18,100)
    @paredext4.x = 300
    @paredext4.y = 468
    @paredext4.alpha = 0
    @stage.addChild @paredext4
    @pared.push @paredext4

    @paredext5 = new Rectangle(0x6D88A2, 0, 0, 18, 65,100)
    @paredext5.x = 412
    @paredext5.y = 420
    @paredext5.alpha = 0
    @stage.addChild @paredext5
    @pared.push @paredext5

    @paredext6 = new Rectangle(0xC875D6, 0, 0, 150, 18,100)
    @paredext6.x = 412
    @paredext6.y = 420
    @paredext6.alpha = 0
    @stage.addChild @paredext6
    @pared.push @paredext6

    @paredext7 = new Rectangle(0x544202, 0, 0, 18, 295,100)
    @paredext7.x = 543
    @paredext7.y = 140
    @paredext7.alpha = 0
    @stage.addChild @paredext7
    @pared.push @paredext7

    @paredext8 = new Rectangle(0x808080, 0, 0, 265, 15,100)
    @paredext8.x = 300
    @paredext8.y = 122
    @paredext8.alpha = 0
    @stage.addChild @paredext8
    @pared.push @paredext8

    @paredext9 = new Rectangle(0xFE3E00, 0, 0, 250, 18,100)
    @paredext9.x = 300
    @paredext9.y = 93
    @paredext9.alpha = 0
    @stage.addChild @paredext9
    @pared.push @paredext9

    @paredext10 = new Rectangle(0xE1AF10, 0, 0, 18, 55,100)
    @paredext10.x = 525
    @paredext10.y = 50
    @paredext10.alpha = 0
    @stage.addChild @paredext10
    @pared.push @paredext10


    @paredint = new Rectangle(0xffff00, 0, 0, 18, 172,100)
    @paredint.x = 111
    @paredint.y = 0
    @paredint.alpha = 0
    @stage.addChild @paredint
    @pared.push @paredint

    @paredint2 = new Rectangle(0x043908, 0, 0, 65, 18,100)
    @paredint2.x = 125
    @paredint2.y = 155
    @paredint2.alpha = 0
    @stage.addChild @paredint2
    @pared.push @paredint2

    @paredint3 = new Rectangle(0x043908, 0, 0, 18, 65,100)
    @paredint3.x = 170
    @paredint3.y = 175
    @paredint3.alpha = 0
    @stage.addChild @paredint3
    @pared.push @paredint3

    @paredint4 = new Rectangle(0x043908, 0, 0, 65, 18,100)
    @paredint4.x = 125
    @paredint4.y = 235
    @paredint4.alpha = 0
    @stage.addChild @paredint4
    @pared.push @paredint4


    @paredint5 = new Rectangle(0x00ff00, 0, 0, 18, 130,100)
    @paredint5.x = 111
    @paredint5.y = 235
    @paredint5.alpha = 0
    @stage.addChild @paredint5
    @pared.push @paredint5

    @paredint6 = new Rectangle(0xff0040, 0, 0, 190, 18,100)
    @paredint6.x = 111
    @paredint6.y = 355
    @paredint6.alpha = 0
    @stage.addChild @paredint6
    @pared.push @paredint6

    @paredint7 = new Rectangle(0x043908, 0, 0, 18, 50,100)
    @paredint7.x = 282
    @paredint7.y = 310
    @paredint7.alpha = 0
    @stage.addChild @paredint7
    @pared.push @paredint7

    @paredint8 = new Rectangle(0x043908, 0, 0, 150, 18,100)
    @paredint8.x = 282
    @paredint8.y = 310
    @paredint8.alpha = 0
    @stage.addChild @paredint8
    @pared.push @paredint8

    @paredint9 = new Rectangle(0x043908, 0, 0, 18, 50,100)
    @paredint9.x = 410
    @paredint9.y = 310
    @paredint9.alpha = 0
    @stage.addChild @paredint9
    @pared.push @paredint9

    @paredint10 = new Rectangle(0x043908, 0, 0, 65, 18,100)
    @paredint10.x = 410
    @paredint10.y = 355
    @paredint10.alpha = 0
    @stage.addChild @paredint10
    @pared.push @paredint10

    @paredint11 = new Rectangle(0x27D875, 0, 0, 18, 125,100)
    @paredint11.x = 467
    @paredint11.y = 250
    @paredint11.alpha = 0
    @stage.addChild @paredint11
    @pared.push @paredint11

    @paredint12 = new Rectangle(0x043908, 0, 0, 65, 18,100)
    @paredint12.x = 425
    @paredint12.y = 250
    @paredint12.alpha = 0
    @stage.addChild @paredint12
    @pared.push @paredint12

    @paredint13 = new Rectangle(0x043908, 0, 0, 18, 50,100)
    @paredint13.x = 432
    @paredint13.y = 200
    @paredint13.alpha = 0
    @stage.addChild @paredint13
    @pared.push @paredint13

    @paredint14 = new Rectangle(0x33FFE0, 0, 0, 150, 15,100)
    @paredint14.x = 300
    @paredint14.y = 187
    @paredint14.alpha = 0
    @stage.addChild @paredint14
    @pared.push @paredint14

    @paredint15 = new Rectangle(0x043908, 0, 0, 18, 50,100)
    @paredint15.x = 300
    @paredint15.y = 200
    @paredint15.alpha = 0
    @stage.addChild @paredint15
    @pared.push @paredint15

    @paredint16 = new Rectangle(0x043908, 0, 0, 75, 18,100)
    @paredint16.x = 225
    @paredint16.y = 235
    @paredint16.alpha = 0
    @stage.addChild @paredint16
    @pared.push @paredint16

    @paredint17 = new Rectangle(0x0000ff, 0, 0, 18, 220,100)
    @paredint17.x = 205
    @paredint17.y = 28
    @paredint17.alpha = 0
    @stage.addChild @paredint17
    @pared.push @paredint17

    @paredint18 = new Rectangle(0xbf00ff, 0, 0, 280, 18,100)
    @paredint18.x = 205
    @paredint18.y = 20
    @paredint18.alpha = 0
    @stage.addChild @paredint18
    @pared.push @paredint18
    
    @parche = new Rectangle(0xEC460A, 0, 0, 37, 20,100)
    @parche.x = 0
    @parche.y = 100
    @parche.alpha = 10
    @stage.addChild @parche
    @obstaculo.push @parche
    

    @invisible1 = new Rectangle(0xbf00ff, 0, 0, 17, 5,100)
    @invisible1.x = 55
    @invisible1.y = 100
    @invisible1.alpha = 0
    @stage.addChild @invisible1
    @obstaculo.push @invisible1

    @animate()

  collision: (rect1, arr) ->
    for n in arr
      if (rect1.x - rect1.width/2 + 3< n.x + n.width && rect1.x - rect1.width/2 - 8 + rect1.width > n.x && rect1.y - rect1.height/2 + 5  < n.y + n.height && rect1.height + rect1. y - rect1.height/2 - 5 > n.y)
          return true
    return false

  animate:=>
    @ticker.add ()=>
      if @collision(@anim, @pared)
#        @anim.x = 80
#        @anim.y = 85
        @daga.x = 0
        @pause = true
      if @collision(@anim, @obstaculo)
        @daga.x += 55


        
      for n in @animationNodes
        n.animate?()


module.exports = App
