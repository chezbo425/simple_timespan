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
      result << "#{years} #{year_or_years_string}"
    end

    if days > 0
      result << "#{days} #{day_or_days_string}"
    end

    if hours > 0
      result << "#{hours} #{hour_or_hours_string}"
    end

    if minutes > 0
      result << "#{minutes} #{minute_or_minutes_string}"
    end

    if (seconds > 0) || result.none?
      result << "#{seconds} #{second_or_seconds_string}"
    end

    result.join(' ')
  end

  ##
  # Returns a string that describes the Timespan as a time in the past.
  #
  # i.e., 2 years ago
  def to_s_ago
    prefix =
      if !years.zero?
        "#{years} #{year_or_years_string}"
      elsif !days.zero?
        "#{days} #{day_or_days_string}"
      elsif !hours.zero?
        "#{hours} #{hour_or_hours_string}"
      elsif !minutes.zero?
        "#{minutes} #{minute_or_minutes_string}"
      elsif !seconds.zero?
        "#{seconds} #{second_or_seconds_string}"
      end

    prefix + ' ago'
  end

  private

  def year_or_years_string
    (years == 1) ? 'year' : 'years'
  end

  def day_or_days_string
    (days == 1) ? 'day' : 'days'
  end

  def hour_or_hours_string
    (hours == 1) ? 'hour' : 'hours'
  end

  def minute_or_minutes_string
    (minutes == 1) ? 'minute' : 'minutes'
  end

  def second_or_seconds_string
    (seconds == 1) ? 'second' : 'seconds'
  end
end