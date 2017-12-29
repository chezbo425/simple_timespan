class SimpleTimespan

  def initialize(sec_with_fraction)
    @nanoseconds = ((sec_with_fraction % 1) * (10 ** 9)).round
    # Convert to whole seconds
    _remaining_time = sec_with_fraction.floor
    @seconds = _remaining_time % 60
    # Convert to Minutes
    _remaining_time /= 60
    @minutes = _remaining_time % 60
    # Convert to Hours
    _remaining_time /= 60
    @hours = _remaining_time % 24
    # Convert to Days
    _remaining_time /= 24
    @days = _remaining_time % 365
    # Convert to Years
    _remaining_time /= 365
    @years = _remaining_time
  end

  attr_reader :nanoseconds, :seconds, :minutes, :hours, :days, :years

  alias nsec nanoseconds
  alias sec seconds

  def microseconds
    nanoseconds / 1000
  end

  alias usec microseconds

  def milliseconds
    nanoseconds / 1_000_000
  end

  alias msec milliseconds

  def to_s
    result = []
    if years > 0
      _suffix = (years == 1) ? "year" : "years"
      result << "#{years} #{_suffix}"
    end

    if days > 0
      _suffix = (days == 1) ? "day" : "days"
      result << "#{days} #{_suffix}"
    end

    if hours > 0
      _suffix = (hours == 1) ? "hour" : "hours"
      result << "#{hours} #{_suffix}"
    end

    if minutes > 0
      _suffix = (minutes == 1) ? "minute" : "minutes"
      result << "#{minutes} #{_suffix}"
    end

    if (seconds > 0) || (result.length == 0)
      _suffix = (seconds == 1) ? "second" : "seconds"
      result << "#{seconds} #{_suffix}"
    end

    result.join(' ')
  end
end