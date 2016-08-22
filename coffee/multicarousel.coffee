mc_intervalms = 5000
mc_interval = false

reposition = (e) ->
  $(".multicarousel").each (idx, el) ->
    clearInterval mc_interval if mc_interval is not false
    mc_interval = false

    mc_itemwidth = 250

    mc = $(el)
    mc_inner = mc.children(".multicarousel-inner").first()
    mc_items = mc_inner.children(".item")
    mc_visible = mc_items.not(".hidden")
    mc_first = mc_visible.filter(".active")

    mc_width = mc_inner.innerWidth()
    if mc_width == 1170
      mc_numitems = 4  # Large/wide desktop
    else if mc_width == 970  # Desktop
      mc_numitems = 3
    else if mc_width == 750  # Tablet
      mc_numitems = 2
    else
      mc_numitems = 0  # Smartphone

    mc_firstidx = mc_items.index(mc_first.get(0))

    mc_firstx = mc_width / 2 - mc_itemwidth * mc_numitems / 2
    mc_first.css("left", "#{mc_firstx}px")

    for itemidx in [0..mc_items.length]
      do (itemidx) ->
        if itemidx == mc_firstidx or
            mc_firstidx + mc_numitems - 1 > mc_items.length
          console.log "itemidx:", itemidx
          return
    mc_interval = setInterval(next_item, mc_intervalms) if mc_interval is false
    return

next_item = (e) ->
  "pass"
  return

window.addEventListener "resize", reposition
reposition()
