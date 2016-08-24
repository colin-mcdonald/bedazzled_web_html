$(".multicarousel").each (idx, el) ->
  mc_intervalms = 10000
  mc_interval = false  # Interval ID, or false if no interval is set
  mc = $(el)
  mc_inner = mc.children(".multicarousel-inner").first()
  mc_items = mc_inner.children(".item")

  reposition = (e) ->
    if mc_interval isnt false
      clearInterval mc_interval
      mc_interval = false

    mc_width = mc_inner.innerWidth()
    if mc_width == 1170  # Large/wide desktop
      mc_numitems = 4  # Number of active items on the multi-item carousel
    else if mc_width == 970  # Desktop
      mc_numitems = 3
    else if mc_width == 750  # Tablet
      mc_numitems = 2
    else  # Smartphone
      mc_numitems = 0

    mc_first = mc_items.not(".hidden").filter(".first").first()

    mc_itemwidth = (mc_width - 170) / mc_numitems
    mc_spacing = mc_itemwidth + 8

    mc_firstidx = mc_items.index(mc_first.get(0))
    mc_lastidx = mc_firstidx + mc_numitems

    mc_firstx = mc_width / 2 - mc_spacing * mc_numitems / 2
    mc_first.css("left", "#{mc_firstx}px")

    mc_visidxs = (idx % mc_items.length for idx in [mc_firstidx...mc_lastidx])

    for itemidx in [0...mc_items.length]
      do (itemidx) ->
        visidx = mc_visidxs.indexOf itemidx
        mc_items.eq(itemidx).css("width", "#{mc_itemwidth}px")
        if visidx >= 0
          mc_items.eq(itemidx).removeClass("hidden")
            .removeClass("first").removeClass("last")
            .css("left", "#{mc_firstx + mc_spacing * visidx}px")
          mc_items.eq(itemidx).addClass("first") if visidx == 0
          mc_items.eq(itemidx).addClass("last") if visidx == mc_numitems - 1
        else
          mc_items.eq(itemidx).addClass("hidden").removeClass("active")

    mc_interval = setInterval(move_next, mc_intervalms) if mc_interval is false
    return

  move_next = (e) ->
    # Set classes
    mc_nextfirst = mc_items.not(".hidden").filter(".first").first()
      .removeClass("first")
    if mc_nextfirst.is(":last-child")
      mc_nextfirst = mc_items.first()
    else
      mc_nextfirst = mc_nextfirst.next()
    mc_nextfirst.removeClass("hidden").addClass("first")

    reposition()
    return

  move_prev = (e) ->
    # Set classes
    mc_nextfirst = mc_items.not(".hidden").filter(".first").first()
      .removeClass("first")
    if mc_nextfirst.is(":first-child")
      mc_nextfirst = mc_items.last()
    else
      mc_nextfirst = mc_nextfirst.prev()
    mc_nextfirst.removeClass("hidden").addClass("first")

    reposition()
    return

  window.addEventListener "resize", reposition
  mc.on "click", "a[data-slide=prev]", move_prev
  mc.on "click", "a[data-slide=next]", move_next
  reposition()
