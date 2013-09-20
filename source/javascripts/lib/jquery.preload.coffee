$ = jQuery

$.fn.preload = (onSuccess, onError, allComplete)->

  $set  = @
  total = $set.length

  finalize = ->
    if --total is 0 and allComplete?
      allComplete.apply($set)

  $set.each ->
    $img = $(@)

    $ '<img/>',
      src  : @.src
      load : -> onSuccess.apply($img) if onSuccess?
      error: -> onError.apply($img) if onError?
      complete: finalize

