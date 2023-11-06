require_relative "helpers"

def show_event(events,id)
  event = verificar_existe_id(events, id)
  if !event
    return puts "No id found"
  end
  start_time = DateTime.parse(event["start_date"]).strftime("%I:%M")
  puts "#{'date: '.yellow + (DateTime.parse(event["start_date"]).strftime("%Y-%m-%d")).blue}"
  puts "#{'title: '.yellow + event["title"].blue}"
  puts "#{'calendar: '.yellow + event["calendar"].blue}"
  if event["end_date"] != ""
    horas = start_time.to_s + " #{DateTime.parse(event["end_date"]).strftime("%I:%M")}"
    puts "#{'start_end: '.yellow + horas.blue}"
  elsif
    puts "start_end: ".yellow
  end
  puts "#{'notes: '.yellow + event["notes"].blue}"
  puts "#{'guests: '.blue + event["guests"].join(", ").blue}"

end