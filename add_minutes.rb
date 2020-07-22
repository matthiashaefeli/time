require './time_converter.rb'

def add_minutes(time_string, minutes)
  time_converter = TimeConverter.new(time_string)
  time_converter.add_minutes(minutes)
end
