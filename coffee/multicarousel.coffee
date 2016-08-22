reposition = (e) ->
  $(".multicarousel").each (idx, el) ->
    mc = $(el)
    mc_inner = mc.children(".multicarousel-inner").first()
    mc_items = mc_inner.children(".item")
    mc_visible = mc_items.not(".hidden")
    mc_first = mc_visible.filter(".active")

    mc_width = mc_inner.innerWidth()
    mc_numitems = 4  # Large/wide desktop
    if mc_width == 970  # Desktop
      mc_numitems = 3
    else if mc_width == 750  # Tablet
      mc_numitems = 2
    else
      mc_numitems = 0  # Smartphone

    mc_first.css("left", "#{0}px")
    mc_firstidx = mc_items.index(mc_first.get(0))

    mc_firstx = mc_width / 2 - 250 * mc_numitems / 2

    for itemidx in [mc_firstidx..mc_firstidx+mc_numitems]


    # console.log "mc:", mc
    # console.log "mc_inner:", mc_inner
    # console.log "mc_items:", mc_items
    # console.log "mc_visible:", mc_visible
    # console.log "mc_first:", mc_first
    # console.log "mc_firstidx:", mc_firstidx
    console.log "Width and number of items:", mc_width, mc_numitems

window.addEventListener "resize", reposition
reposition()
