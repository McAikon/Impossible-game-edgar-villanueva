Rectangle = require("./elements/Rectangle")
Circle = require("./elements/Circle")
Enemy = require("./elements/Enemy")
Bullet = require("./elements/Bullet")
Bomb = require("./elements/Bomb")
DataCircle = require('./data/circles')
Boost = require("./elements/Boost")
Boss = require("./elements/Boss")
mathjs = require("mathjs")
isMobile = require "ismobilejs"

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  bullets:[]
  enemies:[]
  score: 0
  nave: null
  enemy: null
  boss: null
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener 'mousemove', @onMouseMove
    window.addEventListener 'touchmove', @onTouchMove
    window.addEventListener 'keypress', @onKeyPress
    window.addEventListener 'mousemove', @onMouseFollow
    document.body.style.cursor = 'none'
    @alwaysShoot() if isMobile.any
    @build()
    @buildBoost()
    @buildWeapon()
    @animate()
    @garbageCollector()

  alwaysShoot:=>
    setInterval =>
      bullet = new Bullet(3, @)
      bullet.x = @nave.x
      bullet.y = @nave.y
      @addAnimationNodes bullet
      @stage.addChild bullet
      @bullets.push bullet

    ,100

  onKeyPress: (evt) =>
    if evt.key is 'z'
      bullet = new Bullet(3, @)
      bullet.x = @nave.x
      bullet.y = @nave.y
      @addAnimationNodes bullet
      @stage.addChild bullet
      @bullets.push bullet
    else if evt.key is 'x'
      return if @nave.bombCount is 0
      @nave.bombCount -= 1
      bullet = new Bomb(10, @)
      bullet.x = @nave.x
      bullet.y = @nave.y
      console.log 'Te quedan', @nave.bombCount + ' bombas.'
      @addAnimationNodes bullet
      @stage.addChild bullet

  onTouchMove: (evt)=>
    PosX= evt.changedTouches[0].clientX
    PosY= evt.changedTouches[0].clientY
    @nave.x = PosX
    @nave.y = PosY

  onMouseMove: (evt) =>
    mousePosX = evt.clientX
    mousePosY = evt.clientY
    @nave.x = mousePosX
    @nave.y = mousePosY
    null

  onMouseFollow: (evt) =>
    distX = @nave.x - @boss.x
    distY = @nave.y - @boss.y
    @boss.x += distX / 100
    @boss.y += distY / 50

  build: =>

    @nave = new Circle(0, 0, 20, 0x993366)
    @nave.x = 100
    @nave.y = 200
    @stage.addChild @nave

    @boss = new Boss(40, @)
    @boss.x = mathjs.randomInt(0, window.innerWidth)
    @stage.addChild @boss

    setInterval =>
      @enemy = new Enemy(0, 0, 20, 0xcc0000, @nave, @)
      @enemy.x = mathjs.randomInt(0, window.innerWidth)
      @addAnimationNodes(@enemy)
      @stage.addChild @enemy
      @enemies.push @enemy
    , 2000

  buildBoost: =>
    setInterval =>
      life = new Boost('life')
      @stage.addChild life
      @addAnimationNodes(life)
    , 10000

  buildWeapon: =>
    setInterval =>
      weapon = new Boost('weapon')
      @stage.addChild weapon
      @addAnimationNodes(weapon)
    , 20000

  addAnimationNodes: (child) =>
    @animationNodes.push child
    null

  bulletsVsEnemies: =>
    for e in @enemies
      return unless e
      for b in @bullets
        return unless b
        dx = e.x - b.x
        dy = e.y - b.y
        distance = Math.sqrt(dx * dx + dy * dy)

        if distance < e.r + b.r
#            e.alpha = 0
            @garbageCollector(e)
            @garbageCollector(b)
            @score += 100
            console.log @score

  garbageCollector: (item) =>
    bulletChild = @bullets.indexOf(item)
    if (bulletChild > -1)
      @bullets.splice(bulletChild, 1)

    enemyChild = @enemies.indexOf(item)
    if (enemyChild > -1)
      @enemies.splice(enemyChild, 1)

    animationChild = @animationNodes.indexOf(item)
    if (animationChild > -1)
      @animationNodes.splice(animationChild, 1)

    stageChild = @stage.children.indexOf(item)
    if (stageChild > -1)
      @stage.children.splice(stageChild, 1)

  animate: =>
    @ticker.add () =>
      @bulletsVsEnemies()
      for n in @animationNodes
        return unless n
        n.animate?()
        n.collision?()

    null

module.exports = App
