require "date"
require "colorize"
require_relative "listar"
require_relative "helpers"
require_relative "show"
require_relative "delete"
require_relative "create"
require_relative "update"
# DATA
id = 0
events = [
  { "id" => (id = id.next),
    "start_date" => "2023-02-13T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-13T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-13T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-14T12:00:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2023-02-14T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Mili"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => ["Paulo", "Andre"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-15T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-15T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2023-02-16T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => ["Paulo", "Andre", "Diego"],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-16T00:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-17T09:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2023-02-17T10:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2023-02-18T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-18T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2023-02-18T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-23T00:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2023-02-24T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" }
]

# start program screen
welcome

listar(events)

menu

action = nil

while action != 'exit'
  print "Action: ".yellow
  action = gets.chomp
  case action
  when 'list'
    welcome
    listar(events)
    menu
  when 'next', 'prev'
    welcome
    listar(events, action)
    menu
  when 'show'
    print "Event ".yellow
    print "ID: ".blue
    event_id = gets.chomp.to_i
    show_event(events, event_id)
    menu
  when 'delete'
    print "Event ".yellow
    print "ID: ".blue
    event_id = gets.chomp.to_i
    delete_event(events, event_id)
    menu
  when 'create'
    id = id.next
    date_input = ""
    title_input = ""
    while date_input == ""
      print "date: ".yellow
      date_input = gets.chomp
    end
    date_time_object = DateTime.strptime(date_input, '%d-%m-%Y')
    time_object = Time.new(date_time_object.year, date_time_object.month, date_time_object.day, 9, 0, 0, "-05:00")
    date_input_formatted = time_object.strftime('%FT%T%z')
    while title_input == ""
      print "title: ".yellow
      title_input = gets.chomp
    end
    print "calendar: ".yellow
    calendar_input = gets.chomp
    print "start_end: ".yellow
    start_end_input = gets.chomp.split(" ")
    date_with_time = "#{date_input} #{start_end_input[1]}"
    date_input_formatted = DateTime.parse("#{date_with_time}-05:00")
    date_input_formatted = date_input_formatted.to_s
    start_end_input_formatted = DateTime.parse(date_with_time).strftime('%FT%T%z')
    if start_end_input.length.zero?
       date_input_formatted = DateTime.parse("#{date_input} 00:00-05:00").to_s      
       start_end_input_formatted = ''
      elsif start_end_input.length == 2
        date_input_formatted = DateTime.parse("#{date_input} #{start_end_input[0]}-05:00").to_s      
    end
    print "notes: ".yellow
    notes_input = gets.chomp
    print "guest: ".yellow
    guest_input = gets.chomp
    create(events, id, date_input_formatted, title_input, calendar_input, start_end_input_formatted, notes_input, guest_input)
    menu
  when 'update'
    event_id = ""
      while event_id == ""
        print "Event ".yellow
        print "ID: ".blue
        event_id = gets.chomp.to_i
      end
      print "date: ".yellow
      date_input = gets.chomp
      date_time_object = DateTime.strptime(date_input, '%d-%m-%Y')
      time_object = Time.new(date_time_object.year, date_time_object.month, date_time_object.day, 9, 0, 0, "-05:00")
      date_input_formatted = time_object.strftime('%FT%T%z')
      print "title: ".yellow
      title_input = gets.chomp
      print "calendar: ".yellow
      calendar_input = gets.chomp
      print "start_end: ".yellow
      start_end_input = gets.chomp.split(" ")
      date_with_time = "#{date_input} #{start_end_input[1]}"
      start_end_input_formatted = DateTime.parse(date_with_time).strftime('%FT%T%z')
      print "notes: ".yellow
      notes_input = gets.chomp
      print "guest: ".yellow
      guest_input = gets.chomp
      update(events, event_id, date_input_formatted, title_input, calendar_input, start_end_input_formatted, notes_input, guest_input)
      menu
  end

end

puts "#{"Thanks".yellow} #{"for using calenCLI".blue}"