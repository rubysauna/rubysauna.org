$ ->

  $body       = $('body')
  $background = $('#header .background, #footer .background')

  allComplete =->
    $body.addClass('reveal')
    $(this).css('opacity', 1)
    setTimeout flicker, 4000

  flicker =->
    opacity  = Math.min(1, Math.random() + 0.6)
    duration = Math.random() * 500 + 250
    $background.animate {opacity}, duration, flicker

  $background
    .find('img')
    .preload(null, null, allComplete)


  # DEV:

  if window.location.hostname is 'localhost'
    $body.on 'dblclick', -> $(@).toggleClass 'grid'
