$ = jQuery

$.fn.preload = (onSuccess, onError)->

  $(@).each ->

    $img = $(@)
    $img.css 'opacity', 0

    $ '<img/>',
      src  : @.src
      load : ->
        if onSuccess? then onSuccess.apply(@)
        else $img.animate { 'opacity': 1 }, 2000
      error: ->
        onError.apply(@) if onError?
