require './time_converter.rb'

def addMinutes(time_string, minutes)
  time_converter = TimeConverter.new(time_string)
  time_converter.addMinutes(minutes)
end
