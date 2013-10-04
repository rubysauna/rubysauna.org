$ ->

  $body       = $('body')
  $background = $('#header .background, #footer .background')

  allComplete =->
    $body.addClass('reveal')
    $(this).animate {opacity: 1}, 2000, flicker

  flicker =->
    opacity  = Math.min(1, Math.random() + 0.6)
    duration = Math.random() * 500 + 250
    $background.animate {opacity}, duration, flicker

  $background
    .find('img')
    .css('opacity', 0)
    .preload(null, null, allComplete)


  # DEV:

  if window.location.hostname is 'localhost'
    $body.on 'dblclick', -> $(@).toggleClass 'grid'
