module EventHelpers

  def sorted_events
    data.events.values.sort_by(&:time)
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

  def upcoming_event?(event)
    event.time > (Date.today + 1).to_time
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
