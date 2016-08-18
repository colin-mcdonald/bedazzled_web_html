$(".bedazzled--main-shows.visible-xs-block")
.on("click", "a[data-toggle=collapse]", (e) ->
  content = $(e.delegateTarget).children("#bedazzled--shows-xs-content")
  if content.hasClass("collapse") and not content.hasClass("in")
    $(e.target).children("i.fa-plus").removeClass("fa-plus").addClass("fa-minus")
    content.collapse('show')
  else
    $(e.target).children("i.fa-minus").removeClass("fa-minus").addClass("fa-plus")
    content.collapse('hide')
)
