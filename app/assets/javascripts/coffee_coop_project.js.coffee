$ ->
  $(".fadeout").delay(5000).fadeOut(1000)
  $('.row-linked tr').click(->
      window.location = $(this).find("a").attr("href")
  ).hover ->
    $(this).toggleClass "hover"

