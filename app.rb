require 'dotenv'
require "pry"
require './lib/user'
require './lib/event'
require './lib/event_creator'
require './lib/calendar_displayer'
require 'time'
require 'date'

Dotenv.load('/var/www/html/github/scripts_ruby/../.env')

def calendar
  julie = User.new("julie@email.com", 35)
  jean = User.new("jean@maimail.com", 22)
  norredine = User.new("jean@maimail.com", 41)
  samia = User.new("julie@email.com", 54)
  Event.new("2021-10-13 09:00", 10, "standup quotidien", [jean, julie])
  Event.new("2019-10-23 09:00", 10, "Tadam", [samia, julie])
  Event.new("2019-01-01 09:00", 10, "poumpoum", [norredine, jean])
binding.pry
end

calendar
