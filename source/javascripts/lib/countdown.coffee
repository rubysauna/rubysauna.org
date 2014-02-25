class Scroller
	constructor: (selector) ->
		@elements = $(selector)
		@size = @elements.length
		@active = 0

	prev_index: (i) ->
		i--
		if i < 0
			i = @size - 1
		return i

	animate: ->
		# move current element to right
		current = $(@elements[@active])
		current.addClass('animate')
		current.css('left', '0%')

		# start moving previous element to right
		prev_index = @prev_index( @active )
		previous = $(@elements[prev_index])
		previous.css('left', '100%')

		# make sure that the one that is on right side moves back to left side
		prev_index = @prev_index( prev_index )
		previous = $(@elements[prev_index])
		previous.css('left', '-100%')
		previous.removeClass('animate')

		# increase the counter, and reset if it goes over
		@active += 1
		if @active >= @size
			@active = 0

class Countdown
	constructor: (selector) ->
		@selector = $(selector)
		@deadline = new Date()
		@deadline.setHours(23)
		@deadline.setMinutes(10)
		@deadline.setSeconds(0)
		@deadline.setMilliseconds(0)
	start: ->
		setInterval =>
			@update()
		,900
		@update()

	update: ->
		delta_in_seconds = (@deadline.getTime() - Date.now()) / 1000
		minutes = parseInt(delta_in_seconds / 60)
		seconds = parseInt(delta_in_seconds % 60)
		if minutes < 0
			minutes = 0
		if seconds < 0
			seconds = 0
		minutes = String('00'+minutes).slice(-2)
		seconds = String('00'+seconds).slice(-2)	
		@selector.html(minutes+":"+seconds)


$ ->
	countdown = new Countdown('.countdown h1')
	countdown.start()
	scroller = new Scroller('.scroll-element')
	setInterval -> 
		scroller.animate()
	, 6000

	scroller.animate()
