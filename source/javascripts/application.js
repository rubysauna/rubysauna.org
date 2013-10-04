//= require 'lib/jquery.preload'

$(function(){

  function onSuccess() {}
  function onError() {}

  function allComplete() {
    $('body').addClass('reveal');
    setTimeout(flicker, 2000);
  }

  $('.background img').preload(onSuccess, onError, allComplete);

  $('body').on('dblclick', function() {
    $(this).toggleClass('grid');
  });

  var $background = $('#header .background, #footer .background');
  function flicker() {
    var opacity = Math.min(1, Math.random() + 0.6),
        duration = Math.random() * 500 + 250;

    $background.animate({ opacity: opacity }, duration, flicker);
  }


});
