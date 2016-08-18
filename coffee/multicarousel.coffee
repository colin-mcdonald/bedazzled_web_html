multicarousel_root = $(".multicarousel")
multicarousel_inner = multicarousel_root.children(".multicarousel-inner").first()
multicarousel_items = multicarousel_inner.children(".item")
multicarousel_visible = multicarousel_items.not(".hidden")
multicarousel_active = multicarousel_visible.filter(".active")

console.log multicarousel_root
console.log multicarousel_inner
console.log multicarousel_items
console.log multicarousel_visible
console.log multicarousel_active
