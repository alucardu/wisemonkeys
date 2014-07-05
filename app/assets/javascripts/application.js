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

  $('.close').click(function(){
    $('.container-overlay-contest').fadeOut();
    $('.container-overlay-info').fadeOut();
    $('.container-overlay-picture').fadeOut();
    $('#bg-overlay').fadeOut();
  });

  $('.container-overlay-contest').hide();
  $('.participate').click(function(e){
    e.preventDefault();
    $('.container-overlay-contest').fadeIn();
    $('#bg-overlay').fadeIn();
  });

  $('.container-overlay-info').hide();
  $('.more-info').click(function(e){
    e.preventDefault();
    $('.container-overlay-info').fadeIn();
    $('#bg-overlay').fadeIn();
  });

  $('.container-overlay-picture').hide();
  $('.check-art').click(function(e){
    e.preventDefault();
    $('.container-overlay-picture').fadeIn();
    $('#bg-overlay').fadeIn();
  });
    

});