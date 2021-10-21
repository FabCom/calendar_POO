class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @@events_all = []
  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees  = attendees
    @@events_all.push(self)
  end

  def postpone_24h
    self.start_date + Time.parse(3600 * 24)
  end

  def end_date
    self.start_date = self.start_date + self.duration * 60
  end

  def is_past?
    self.end_date < Time.now ? true : false
  end

  def is_future?
    self.end_date > Time.now ? true : false
  end

  def is_soon?
    Time.now - self.start_date < Time.parse(30 * 60)
  end

  def to_s
    puts "Titre : " + self.title
    puts "Durée : " + self.duration.to_s + " minutes"
    print "Invité·e·s : " ; self.attendees.each {|current| print "#{current}, "}
  end

  def self.all
    @@events_all
  end

  def self.get_by_date(year, month, day)
    date = Time.parse("#{year}-#{month}-#{day}")
    event = Event.all.select {|event| event.start_date.year == date.year && event.start_date.month == date.month}
  end

  def age_analysis #age moyen des participant·e·s
    age_array = []
    average = 0

    @attendees.each do |attendee|
      age_array << attendee.age
      average = average + attendee.age
    end

    average = average / @attendees.length

    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end
end
