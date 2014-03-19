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

  return
