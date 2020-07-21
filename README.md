# Time

Without using any built-in date or time functions, write a function or method that accept two mandatory arguments: the first argument is a 12-hour time string with the format "[H]H:MM {AM|PM}", and the second argument is a signed integer, The second argument is the number of minutes to add to the time of day represented by the first argumen. The return value should be a string of the same format as the first argument.

Example:

AddMinutes("9:13 AM", 200)
=> "12:33 PM"
