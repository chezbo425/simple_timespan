require 'bigdecimal'
require './test/test_helper'

class SimpleTimespanTest < Minitest::Test
  def test_initialize_all_components
    timespan = SimpleTimespan.new(BigDecimal.new("166_405_532.123456789"))
    assert timespan.years == 5
    assert timespan.days == 100
    assert timespan.hours == 23
    assert timespan.minutes == 45
    assert timespan.seconds == 32
    assert timespan.sec == 32
    assert timespan.milliseconds == 123
    assert timespan.msec == 123
    assert timespan.microseconds == 123_456
    assert timespan.usec == 123_456
    assert timespan.nanoseconds == 123_456_789
    assert timespan.nsec == 123_456_789
  end

  def test_initialize_individual_components_seconds
    timespan = SimpleTimespan.new(0)
    assert timespan.seconds == 0

    timespan = SimpleTimespan.new(1)
    assert timespan.seconds == 1

    timespan = SimpleTimespan.new(59)
    assert timespan.seconds == 59

    timespan = SimpleTimespan.new(60)
    assert timespan.seconds == 0
  end

  def test_initialize_individual_components_minutes
    timespan = SimpleTimespan.new(59)
    assert timespan.minutes == 0

    timespan = SimpleTimespan.new(60)
    assert timespan.minutes == 1

    timespan = SimpleTimespan.new(119)
    assert timespan.minutes == 1

    timespan = SimpleTimespan.new(120)
    assert timespan.minutes == 2
  end

  def test_initialize_individual_components_hours
    timespan = SimpleTimespan.new(3599)
    assert timespan.hours == 0

    timespan = SimpleTimespan.new(3600)
    assert timespan.hours == 1

    timespan = SimpleTimespan.new(7199)
    assert timespan.hours == 1

    timespan = SimpleTimespan.new(7200)
    assert timespan.hours == 2
  end

  def test_initialize_individual_components_days
    timespan = SimpleTimespan.new(86_399)
    assert timespan.days == 0

    timespan = SimpleTimespan.new(86_400)
    assert timespan.days == 1

    timespan = SimpleTimespan.new(172_799)
    assert timespan.days == 1

    timespan = SimpleTimespan.new(172_800)
    assert timespan.days == 2
  end

  def test_initialize_individual_components_years
    timespan = SimpleTimespan.new(31535999)
    assert timespan.years == 0

    timespan = SimpleTimespan.new(31536000)
    assert timespan.years == 1

    timespan = SimpleTimespan.new(63071999)
    assert timespan.years == 1

    timespan = SimpleTimespan.new(63072000)
    assert timespan.years == 2
  end

  def test_to_s_zero
    timespan = SimpleTimespan.new(0)
    assert timespan.to_s == "0 seconds"
  end
end