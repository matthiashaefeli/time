class TimeConverter
  attr_reader :timeString

  def initialize(time_string)
    @timeString     = time_string
    @totalMinutes   = minutes()
    @hours          = @timeString.split(':').first.to_i
    @minutes        = @timeString.split(' ').first.split(':')[1].to_i
    @am_or_pm       = @timeString.split(' ')[1]
  end


  # convert time in minutes
  def minutes
    time = @timeString.split(' ')[1]
    hours_minutes = @timeString.split(' ')[0]

    hours = hours_minutes.split(':')[0]
    minutes = hours_minutes.split(':')[1]

    real_hours = time == 'AM' ? hours.to_i : hours.to_i + 12
    (real_hours * 60) + minutes.to_i
  end

  def showTime
    @hours = @totalMinutes / 60
    rest = @totalMinutes % 60

    days, @hours = @hours.divmod(24) if @hours > 24

    if @am_or_pm == 'PM' && @hours > 12 || @am_or_pm == 'AM' && @hours >= 13
      @hours -= 12
    end

    @minutes = rest

    rest =
    if rest == 0
      '00'
    elsif rest < 10
      "0#{rest}"
    else
      rest
    end

    @timeString = "#{@hours}:#{rest} #{@am_or_pm}"
  end

  def addMinutes(minutes)
    # hours and minutes left to change form AM to PM or reverse
    hours_left = @hours < 12 ? 12 - @hours : @hours
    minutes_left = 60 - @minutes

    # set total minutes
    @totalMinutes += minutes

    # we need this hours to check how much hours we add
    hours = minutes / 60

    # change AM to PM or reverse
    if (hours <= 1 && hours_left <= 1 && minutes >= minutes_left) || (hours == hours_left && minutes >= minutes_left)
      @am_or_pm = @am_or_pm == 'AM' ? 'PM' : 'AM'
    end

    showTime()
  end

end