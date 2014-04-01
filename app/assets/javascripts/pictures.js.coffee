jQuery ($) ->
  
  $("a[data-type='json']").on "ajax:success", (event, votes, status, xhr) ->
    alert votes
    $(this).parents("div.article").find(".details").html "<div>Title: " + data.title + "</div>" + "<div>Body: " + data.body + "</div>"
