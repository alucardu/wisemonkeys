// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $("#btn-vote").click(function(){
    $container.imagesLoaded(function(){
    // Initialize Masonry plugin on containing element 
      $(container).masonry({
        // options
        itemSelector : '.item',
        gutter: 0
      });
    });
  });

  // Stores the container element in a variable
  $container = $("#container");
  
  // Detect when images are loaded then execute action
  $container.imagesLoaded(function(){
    // Initialize Masonry plugin on containing element 
    $(container).masonry({
      // options
      itemSelector : '.item',
      gutter: 0
    });
  });  

  // Creates a function called dragDrop
  (function dragoDrop() {
  
  // Creates a variable called lastPlace
  var lastPlace;

    // Links the .painting container with the jQueryUI draggable function
    $(".painting").draggable({
      // Options from jQueryUI
      revert: true,
      zIndex: 10,
      snap: ".vote",
      snapMode: "inner",
      snapTolerance: 40,
      start: function (event, ui) {
          lastPlace = $(this).parent();
      }
    });

    // Allows the .painting to be dropped in the .vote
    $( ".vote" ).droppable({
      // Options from the jQueryUI
      drop: function( event, ui ) {
        var dropped = ui.draggable;
        // Store the element (.vote container) in which .painting has been dropped
        var droppedOn = this;
        
        // Check if the .vote container has content
        if ($(droppedOn).children().length > 0) {
            // if it does it detaches the .painting from the .vote container and puts it back using the stored data.
            $(droppedOn).children().detach().prependTo($(lastPlace));
        }
        
        // When the .painting has been dropped it gives the following CSS, detaches it from the current container and puts it in the droppedOn variable
        $(dropped).detach().css({
            top: 0,
            left: 0
        }).prependTo($(droppedOn));

        // When the drag and drop action has been complete this will reload Masonry filling up the gaps
        msnry = new Masonry( container );
      }
    });
  })(jQuery);

  // Toggle a div on a mouse enter/leave. Use delegate to only use this function in the .vote container
  $('.vote').delegate('.painting', 'mouseenter mouseleave', function() {
    $(this).parent().find(".message").stop().fadeToggle()
  });

  $('.vote').delegate('.painting', 'click', function(e) {
    e.preventDefault();
    $(this).appendTo(".js-masonry");
      msnry = new Masonry( container );      
  });

  // Toggle a div on a mouse enter/leave. Use delegate to only use this function in the #drag container
  $('#drag').delegate('.painting', 'mouseenter mouseleave', function() {
    $(this).find(".overlay").stop().slideToggle(350)
  });

  //ImageBooth function
  $('#drag').delegate('.painting', 'click', function(e) {
    e.preventDefault();
    $("#overlay-booth").fadeIn()
    // Store the href of a link in a variable
    var image_href = $(this).find('a').attr("href");
    // Changes the html of the container div, addes the stored href link between img tags
    $('#container-image').html('<img src="' + image_href + '" />');
  });

  $('#close').click(function(){
    $("#overlay-booth").fadeOut()
  });

  $("#container-search input").click(function () {
      var container = $('#container-content'),
          scrollTo = $('#container-search');

      container.animate({
          scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
      }, 1500, 'easeInSine', function () {});
  });


  $('#feedback-form').hide();
  $('#feedback p').click(function(){
    $('#feedback-form').fadeToggle();
  });

  $('.container-overlay-contest').hide();

  $('.participate').click(function(e){
    e.preventDefault();
    $(this).parent().find('.container-overlay-contest').fadeIn();
    $('#bg-overlay').fadeIn();
  });

  $('.close').click(function(){
    $('.container-overlay-contest').fadeOut();
    $('.container-overlay-info').fadeOut();
    $('.container-overlay-picture').fadeOut();
    $('#bg-overlay').fadeOut();
  });

  $('.container-overlay-info').hide();
  $('.more-info').click(function(e){
    e.preventDefault();
    $(this).parent().find('.container-overlay-info').fadeIn();
    $('#bg-overlay').fadeIn();
  });

  $('.container-overlay-picture').hide();
  $('.check-art').click(function(e){
    e.preventDefault();
    $('.container-overlay-picture').fadeIn();
    $('#bg-overlay').fadeIn();
  });

  $("#header ul , #bg-overlay").hide();
  $("#header #menu").hover(function(e){
    e.preventDefault();
    $(this).find("ul").stop().fadeToggle(350);
    $("#bg-overlay").stop().fadeToggle(350);
  });

  $("#header ul , #bg-overlay").hide();
  $("#login a").click(function(e){
    e.preventDefault();
    $("#form").fadeIn(350);
    $("#bg-overlay").stop().fadeIn(350);
  });

  $('.close').click(function(){
    $('body').find("#form").fadeOut(350);
    $('body').find("#bg-overlay").stop().fadeOut(350);
  });  

});