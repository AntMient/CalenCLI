require 'date'
require_relative "week_creator"
require 'colorize'

$date = Date.parse("2023-02-13T00:00:00-05:00")
def listar(events, action = nil)
  if action == 'next'
    $date += 7
  elsif action == 'prev'
    $date -= 7
  end
  week_calendar = create_week_calendar($date)

  same_day = nil
  events
  .sort_by { |event| event["start_date"] }
  .each do |event|
    simple_day = DateTime.parse(event["start_date"]).strftime("%a %b %d")
    start_time = DateTime.parse(event["start_date"]).strftime("%H:%M")
    end_time = DateTime.parse(event["end_date"]).strftime("%I:%M") if event["end_date"] != ""
    id = event["id"]
    if week_calendar.include? simple_day
      week_calendar.each do |key, value|
        if key == simple_day
          week_calendar[simple_day].push({
            title: event['title'],
            start: start_time,
            end: end_time,
            id: id
          })
        end
      end

    end
    
  end
  # week_calendar.each {|date, tasks| puts tasks.length}
  week_calendar.each do |day, tasks|
    if tasks.length.zero?
      print "\n#{day[0..2]}".yellow
      print "#{day[3..-1]}  ".blue
      print "#{" " *6}  #{" " * 6} No event today\n".blue
    else
      validate_day = nil
      tasks.each do |task|
        if day != validate_day
          print "\n#{day[0..2]}".yellow
          print "#{day[3..-1]}  ".blue
          validate_day = day
        else
          print "#{" " * 12}"
        end
        print "#{task[:end].nil? ? " " * 5 : task[:start].yellow} - #{task[:end].nil? ? " " * 5 : task[:end].blue}  #{task[:title].blue} (#{task[:id].to_s.blue})\n"
      end
    end
  end
end
