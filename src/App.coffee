Circle = require("./elements/Circle")
DataParedes = require('./data/paredes')
fdata = require('./assets/Jugador.json')
Jugador = require('./assets/Jugador.png')
dagaImage = require('./assets/daga.png')
lanzaImage = require('./assets/lanza.png')
BgImage = require('./assets/stage.png')
Bgcamino = require('./assets/camino.png')
Bglava = require('./assets/lava.png')
Jugador = require('./assets/Jugador.png')
picosImage = require('./assets/picos.png')
stage = require('./elements/stage')
Rectangle = require("./elements/Rectangle")
Pared = require('./elements/Pared')
DataInvisibles = require('./data/invisibles')
Invisible = require('./elements/Invisible')
Invisible2 = require('./elements/invisible2')
Invisible3 = require('./elements/invisible3')
Invisible4 = require('./elements/invisible4')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  pared:[]
  obstaculo:[]
  obstaculo2:[]
  obstaculo3:[]
  obstaculo4:[]
  obstaculo5:[]
  daga:[]
  picos:[]
  lanza:[]
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
      PIXI.loader.add([fdata, BgImage, Bgcamino, Bglava, dagaImage,picosImage,lanzaImage]).load(@build)

    
  build:()=>

    Bg = new stage (BgImage)
    @daga = new stage (dagaImage)
    @stage.addChild Bg
    @stage.addChild @daga

    @daga.width = 50
    @daga.height = 70
    @daga.x = 0
    @daga.y = 80
    @daga.alpha = 0
    @pared.push @daga

    @picos = new stage (picosImage)
    @stage.addChild @picos

    @picos.width = 20
    @picos.height = 60
    @picos.x = 50
    @picos.y = 300
    @picos.alpha = 0
    @pared.push @picos

    @lanza = new stage(lanzaImage)
    @stage.addChild @lanza


    @lanza.width = 10
    @lanza.height = 80
    @lanza.x = 340
    @lanza.y = 390
    @lanza.alpha = 0
    @addAnimationNodes @lanza
    @pared.push @lanza

    for p in DataParedes
      pared = new Pared(p, @)
      @stage.addChild(pared)
      @pared.push(pared)
    for inv in DataInvisibles
      if inv.evt is "daga"
        invisible = new Invisible(inv, @)
        @stage.addChild(invisible)
        @obstaculo.push(invisible)
    for inv in DataInvisibles
      if inv.evt is "bala"
        invisible = new Invisible(inv, @)
        @stage.addChild(invisible)
        @obstaculo3.push(invisible)
    for inv2 in DataInvisibles
      if inv2.evt is "picos"
        invisible2 = new Invisible2(inv2, @)
        @stage.addChild(invisible2)
        @obstaculo2.push(invisible2)
    for inv3 in DataInvisibles
      if inv3.evt is "lanza"
        invisible3 = new Invisible3(inv3, @)
        @stage.addChild(invisible3)
        @obstaculo4.push(invisible3)  
    for inv4 in DataInvisibles
      if inv4.evt is "bala2"
        invisible4 = new Invisible4(inv4, @)
        @stage.addChild(invisible4)
        @obstaculo5.push(invisible4)


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


    @bala = new Rectangle(0x000000, 0, 0, 5, 5,100)
    @bala.x = 90
    @bala.y = 425
    @bala.alpha = 1
    @stage.addChild @bala
    @addAnimationNodes @bala
    @pared.push @bala

    @bala2 = new Rectangle(0x000000, 0, 0, 5, 5,100)
    @bala2.x = 515
    @bala2.y = 425
    @bala2.alpha = 1
    @stage.addChild @bala2
    @addAnimationNodes @bala2
    @pared.push @bala2
    

    @animate()

  collision: (rect1, arr) ->
    for n in arr
      if (rect1.x - rect1.width/2 + 3< n.x + n.width && rect1.x - rect1.width/2 - 8 + rect1.width > n.x && rect1.y - rect1.height/2 + 5  < n.y + n.height && rect1.height + rect1. y - rect1.height/2 - 5 > n.y)
          return true
    return false

  addAnimationNodes: (child)=>
    @animationNodes.push child

  animate:=>
    @ticker.add ()=>
      if @collision(@anim, @pared)

        @anim.alpha = 0
        @daga.x = 0
      if @collision(@anim, @obstaculo3) 
         @bala.velocidad = -35
      if @collision(@anim, @obstaculo) 
        @daga.x += 55
        @daga.alpha = 1

      if @collision(@anim, @obstaculo2) 
        @picos.alpha = 1
        @anim.alpha = 0

      if @collision(@anim, @obstaculo4) 
        @lanza.alpha = 1
        @anim.alpha = 0
        @lanza.velocidad = 20

      if @collision(@anim, @obstaculo5) 
        @bala2.velocidad = -15
  


        
      for n in @animationNodes
        n.animate?()


module.exports = App
