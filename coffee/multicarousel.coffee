reinit_pos = (e) ->
  $(".multicarousel").each (idx, el) ->
    multicarousel = $(el)
    multicarousel_inner = multicarousel.children(".multicarousel-inner").first()
    multicarousel_items = multicarousel_inner.children(".item")
    multicarousel_visible = multicarousel_items.not(".hidden")
    multicarousel_active = multicarousel_visible.filter(".active")

    multicarousel_visible.each (idx, el) ->
      mitem = $(el)
      mitem.css("left", 250 * idx)

    console.log multicarousel
    console.log multicarousel_inner
    console.log multicarousel_items
    console.log multicarousel_visible
    console.log multicarousel_active

window.addEventListener "resize", reinit_pos
reinit_pos()
