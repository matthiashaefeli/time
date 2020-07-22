# Time

Without using any built-in date or time functions, write a function or method that accept two mandatory arguments: the first argument is a 12-hour time string with the format "[H]H:MM {AM|PM}", and the second argument is a signed integer, The second argument is the number of minutes to add to the time of day represented by the first argument. The return value should be a string of the same format as the first argument.

Example:

addMinutes("9:13 AM", 20)
=> "9:33 AM"


## Requirements
This code has been run and tested by Ruby 2.7.0

## Installation

No installation needed

Clone or Download the repo

## Tests
To run the tests

cd time -> rspec time_converter_spec.rb

## Run Application

cd time -> irb

```
2.7.0 :001 > load 'add_minutes.rb'
 => true
2.7.0 :002 > addMinutes('10:10 PM', 60)
 => "11:10 PM"
```
