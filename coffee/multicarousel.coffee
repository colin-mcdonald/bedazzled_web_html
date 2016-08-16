multicarousel_root = $(".multicarousel")
for multicarousel in multicarousel_root
  multicarousel_inner = multicarousel_root.children("multicarousel-inner").first()
  multicarousel_visible = multicarousel_inner.children(".item").not(".hidden")
  multicarousel_active = multicarousel_visible.is(".active")

  console.log multicarousel_root
  console.log multicarousel_inner
  console.log multicarousel_visible
  console.log multicarousel_active
