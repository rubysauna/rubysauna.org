module EventHelpers

  def sorted_events
    data.events.values.sort_by(&:date)
  end

  def archived_events
    sorted_events.reject {|event| upcoming_event?(event) }
  end

  def upcoming_events
    sorted_events.select {|event| upcoming_event?(event) }
  end

  def next_event
    upcoming_events.first
  end

  def event_path(event)
    "/archive/#{event.date.year}/#{event.date.month}/#{event.date.day}/index.html"
  end

  def upcoming_event?(event)
    event.date > Date.today
  end

  def next_event_fetch(field, default = nil, &block)
    return unless upcoming_events.any?

    field = field.to_sym
    if (value = next_event.send(field))
      block_given? ? capture_haml { yield(value) } : value
    else
      default
    end
  end

end
