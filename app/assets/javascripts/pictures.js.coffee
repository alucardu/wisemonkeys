jQuery ($) ->
  
  
$(document).ready ->
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
    $(".art").parent().find(".art:lt(4)").fadeOut ->
      $(this).remove()
      return

  $("#container-art, #container-art-bg, .the-one, #container-thanks").hide()
  $(".art").hover ->
    $(this).find("img").stop().toggleClass "the-one"
    return

  $("#container-vote").click ->
    $("#container-art, #container-art-bg").fadeIn()
    return

  $("#container-art-bg").click ->
    $("#container-art, #container-art-bg").fadeOut()
    return

  return