def create(events, next_id, date_input, title_input, calendar_input, start_end_input, notes_input, guest_input)
  events << { "id" => next_id, "start_date" => date_input, "title" => title_input, "calendar" => calendar_input, "end_date" => start_end_input, "notes" => notes_input, "guest" => guest_input }
end