jQuery ($) ->  
  
$(document).ready ->

  $container = $("#container")  
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".item"
      gutter: 0
    return

  
  $("#prev_img").hide()  if $("#prev_img").attr("src", "")
  $("#prev_img").load ->
    $("#prev_img").fadeIn()
    return
 
  $("#prev_img").load ->
    $("#img_cache").hide()
    return
  
  # Preview functie.
  $input = $("#container-btn input")
  $input.on "change", ->
    input = $input[0]
    if input.files and input.files[0]
      reader = new FileReader()
      reader.onload = (evt) ->
        $("#prev_img").attr "src", evt.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $(".art").click ->
    $(".art").parent().find(".art:lt(3)").fadeOut ->
      $(this).remove()
      return

  $("#btn-vote").click ->
    $("#container-art, #container-art-bg").fadeIn()
    return

  $("#container-thanks").click ->
    $("#container-art, #container-art-bg").fadeOut()
    return

  $("#container-search , input").click ->
    container = $("#container-content")
    scrollTo = $("#container-search")
    container.animate scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
  return


return