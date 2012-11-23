jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("#vote_will_attend").on(
    "change",
    ->
      btn = $(".poll.open .btn-primary")
      if $(@).is(":checked")
        btn.removeAttr("disabled")
      else
        btn.attr("disabled", "disabled")
  )
