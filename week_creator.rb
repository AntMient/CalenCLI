require "date"

date = Date.parse("2023-02-16T00:00:00-05:00")

def get_start_day_week(input_date)
  start_day = input_date
  start_day -= 1 until start_day.monday?
  start_day
end


def create_week_calendar(input_date)
  day = get_start_day_week(input_date)
  days = {}
  7.times do
    days[day.strftime("%a %b %d")] = []
    day += 1
  end
  days
end

# week_calendar = create_week_calendar(date)


