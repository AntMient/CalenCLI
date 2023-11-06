def update(events, next_id, date_input, title_input, calendar_input, start_end_input, notes_input, guest_input)
  events[next_id - 1]["start_date"] = date_input
  events[next_id - 1]["title"] = title_input
  events[next_id - 1]["calendar"] = calendar_input
  events[next_id - 1]["end_date"] = start_end_input
  events[next_id - 1]["notes"] = notes_input
  events[next_id - 1]["guest"] = guest_input
end