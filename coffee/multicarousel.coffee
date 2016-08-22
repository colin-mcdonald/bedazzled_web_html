mc_intervalms = 5000
mc_interval = false

reposition = (e) ->
  $(".multicarousel").each (idx, el) ->
    if mc_interval isnt false
      clearInterval mc_interval
      mc_interval = false

    mc_itemwidth = 250

    mc = $(el)
    mc_inner = mc.children(".multicarousel-inner").first()
    mc_items = mc_inner.children(".item")
    mc_visible = mc_items.not(".hidden")
    mc_first = mc_visible.filter(".active")

    mc_width = mc_inner.innerWidth()
    if mc_width == 1170  # Large/wide desktop
      mc_numitems = 4  # Number of active items on the multi-item carousel
    else if mc_width == 970  # Desktop
      mc_numitems = 3
    else if mc_width == 750  # Tablet
      mc_numitems = 2
    else  # Smartphone
      mc_numitems = 0

    mc_firstidx = mc_items.index(mc_first.get(0))

    mc_firstx = mc_width / 2 - mc_itemwidth * mc_numitems / 2
    mc_first.css("left", "#{mc_firstx}px")

    for itemidx in [mc_firstidx...mc_firstidx + mc_numitems]
      do (itemidx) ->
        itemidx %= mc_items.length
        console.log "itemidx:", itemidx
    mc_interval = setInterval(next_item, mc_intervalms) if mc_interval is false
    return

next_item = (e) ->
  "pass"
  return

window.addEventListener "resize", reposition
reposition()
