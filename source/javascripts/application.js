//= require 'lib/jquery.preload'

$(function(){

  $('img').preload(function() {
    console.log(this);
  });

});
