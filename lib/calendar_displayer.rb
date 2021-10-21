class CalendarDisplayer
  @@dayLengthChar = 19
  @@daysOfWeek = [{:id => 1 , :fr => "lundi"}, {:id => 2, :fr => "mardi"} , {:id => 3, :fr => "mercredi"}, {:id => 4, :fr => "jeudi"}, {:id => 5, :fr => "vendredi"}, {:id => 6, :fr => "samedi"}, {:id => 0, :fr => "dimanche"}]
  @@monthOfYear = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
  attr_accessor :year, :month

  def initialize(year=Time.now.year, month=Time.now.month)
    @year = year
    @month = month
    @days_in_month = Date.new(year, month, -1).day
    @first_day_in_month = Date.parse("#{year}-#{month}-01").wday
    # puts days_in_month(year,month)
    calendarTitle()
    calendarHeader()
    calendarMonthDisplay()
  end

  def calendarTitle
    space = " " * (((@@dayLengthChar * 7 - @@monthOfYear[self.month-1].length ) /2)-6)
    puts ; puts
    puts space  + @@monthOfYear[self.month-1].upcase + space
  end

  def calendarHeader
    print "-" * ((@@dayLengthChar * 7)-6) ; puts
    @@daysOfWeek.each {|day| print "| #{day[:fr]}" + " " * (@@dayLengthChar - 3 - day[:fr].length) }; print "|" ; puts
    print "-" * ((@@dayLengthChar * 7)-6) ; puts
  end

  def day_content(day_current="")
    borders_left = [0,18,37,56,75,94,113,132]
    content = " " * 152
    borders_left.each {|i| content[i] = "|"}
    if day_current != ""
      event = Event.get_by_date(year=@year, month=@month, day=day_current)
      if event != []
        content[20, 18] = "ok"
      else
        # content[19, 19] = "none"
      end
    else
      content[19, 19] = "none"
    end
    day_current != "" ? content[2,2] = day.to_s.rjust(2,'0') : content[2,2] = "  "
    #
    return content
  end

  def month_content
    month_for_calendar_display = []
    content = []
    (@first_day_in_month-1).times {|i| month_for_calendar_display.push('')}
    @days_in_month.times {|i| month_for_calendar_display.push(i+1) }
    month_for_calendar_display.each {|i| content.push(day_content(i))}
    return content
  end

  def calendarMonthDisplay
    case_of_month = 1
    rank_of_month = [0,7,14,21,28]
    rank_of_day = [0,18,37,56,75,94,113,132]
    rank_of_month.each do |rank_month_current|
      rank_of_day.each do |rank_day_current|
        month_content()[rank_month_current,7].each do |content|
          print content[rank_day_current,18]
          case_of_month += 1
          if case_of_month == 8
            print "|" ; puts
            case_of_month = 1
          end
        end
      end
      print "-" * ((@@dayLengthChar * 7)-6) ; puts
    end
  end
end
