# class TimeConverter
class TimeConverter
  attr_reader :time_string

  def initialize(time_string)
    @time_string = time_string
    @total_minutes = minutes
    @hours = time_string.split(':').first.to_i
    @minutes = time_string.split(' ').first.split(':')[1].to_i
    @am_or_pm = time_string.split(' ')[1]
  end

  # convert time in minutes
  def minutes
    time = @time_string.split(' ')[1]
    hours_minutes = @time_string.split(' ')[0]

    hours = hours_minutes.split(':')[0]
    minutes = hours_minutes.split(':')[1]

    real_hours = time == 'AM' ? hours.to_i : hours.to_i + 12
    (real_hours * 60) + minutes.to_i
  end

  def show_time
    # get hours and minutes of the total_minutes
    @hours = @total_minutes / 60
    rest = @total_minutes % 60

    # change hours to the right format
    @hours = @hours % 24 if @hours > 24
    if (@am_or_pm == 'PM' && @hours > 12) || (@am_or_pm == 'AM' && @hours >= 13)
      @hours -= 12
    end
    @hours = @hours.zero? ? 12 : @hours

    # change minutes to the righ format
    @minutes = rest
    rest =
      if rest.zero?
        '00'
      elsif rest < 10
        "0#{rest}"
      else
        rest
      end

    @time_string = "#{@hours}:#{rest} #{@am_or_pm}"
  end

  def add_minutes(minutes)
    # set total minutes
    @total_minutes += minutes

    # we need this hours and minutes to check if we change AM or PM
    hours, minutes = minutes.divmod(60)
    hours = hours % 24

    # hours and minutes left to check if we change AM or PM
    minutes_left = 60 - @minutes
    hours_left =
      if @hours < 12
        if minutes_left.positive?
          11 - @hours
        else 12 - @hours
        end
      else
        @hours
      end

    # change AM to PM or reverse
    if hours >= hours_left ||
       (hours_left == 1 && minutes >= minutes_left) ||
       hours > 12
      @am_or_pm = @am_or_pm == 'AM' ? 'PM' : 'AM'
    end

    show_time
  end
end
