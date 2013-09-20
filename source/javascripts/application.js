//= require 'lib/jquery.preload'

$(function(){

  function onSuccess() {}
  function onError() {}

  function allComplete() {
    $('body').addClass('reveal');
  }

  $('h1 img, img.background').preload(onSuccess, onError, allComplete);

});
