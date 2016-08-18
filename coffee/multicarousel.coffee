reinit_pos = (e) ->
  $(".multicarousel").each (idx, el) ->
    mc = $(el)
    mc_inner = mc.children(".multicarousel-inner").first()
    mc_items = mc_inner.children(".item")
    mc_visible = mc_items.not(".hidden")
    mc_first = mc_visible.filter(".active")

    mc_first.css("left", "#{0}px")
    mc_firstidx = mc_visible.index(mc_active.get(0))

    mc_lastidx = if mc_firstidx is 0 then -1 else mc_firstidx - 1
    mc_last = mc_visible.eq(mc_lastidx)

    console.log "mc:", mc
    console.log "mc_inner:", mc_inner
    console.log "mc_items:", mc_items
    console.log "mc_visible:", mc_visible
    console.log "mc_first:", mc_first
    console.log "mc_firstidx:", mc_firstidx
    console.log "mc_lastidx:", mc_lastidx

window.addEventListener "resize", reinit_pos
reinit_pos()
