class EventCreator

  def initialize
    puts "CRÉATION D'UN ÉVÉNEMENT"
    title = addTitle()
    startDate = addStartDate()
    duration = addDuration()
    attendees = addAttendees()
    Event.new(startDate, duration, title, attendees)
  end

  def addTitle
    print "Titre : " ; title = gets.chomp.to_s
    if title == ""
      puts "Tu dois renseigner un titre."
      addTitle()
    else
      title
    end
  end

  def addStartDate
    print "À quelle date et à quelle heure se déroulera-t-il ? (format : 2021-10-26 09:00)" ; dateStart = gets.chomp.to_s
    if dateStart == ""
      puts "Tu dois renseigner une date."
      addStartDate()
    else
      return dateStart
    end
  end

  def addDuration
    begin
      print "Combien de temps durera cet événement (en minutes) ? " ; duration = Integer(gets.chomp)
    rescue
      puts "Il faut que tu renseigne un nombre qui correspond à une durée en minutes."
    end
  end

  def addAttendees
    print "Quels sont les emails des participants ? (emails séparés par un espace)" ; attendees_string = gets.chomp.to_s
      return attendees = Array.new(attendees_string.split)
  end
end
