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

    style = for prefix in ['', '-webkit-', '-moz-']
      "#{prefix}transition-duration: #{duration / 1000}s"
    style.push "opacity: #{opacity}"
    # should be slightly more efficient than $.css
    $background.attr 'style', style.join(';')

    setTimeout flicker, duration

  $background
    .find('img')
    .css('opacity', 0)
    .preload(null, null, allComplete)


  # DEV:

  if window.location.hostname is 'localhost'
    $body.on 'dblclick', -> $(@).toggleClass 'grid'
