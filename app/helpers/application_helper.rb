module ApplicationHelper
    def is_past_event?(event)
        Event.past_events.include?(event) && event.accepted == true ? true : false
    end
end
