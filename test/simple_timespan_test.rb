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
    timespan = SimpleTimespan.new(31_535_999)
    assert timespan.years == 0

    timespan = SimpleTimespan.new(31_536_000)
    assert timespan.years == 1

    timespan = SimpleTimespan.new(63_071_999)
    assert timespan.years == 1

    timespan = SimpleTimespan.new(63_072_000)
    assert timespan.years == 2
  end

  def test_to_s_zero
    timespan = SimpleTimespan.new(0)
    assert timespan.to_s == '0 seconds'
  end

  def test_to_s_singular
    to_s_test_helper(1, '1 second')

    to_s_test_helper(60, '1 minute')

    to_s_test_helper(60*60, '1 hour')

    to_s_test_helper(60*60*24, '1 day')

    to_s_test_helper(60*60*24*365, '1 year')
  end

  def test_to_s_plural
    to_s_test_helper(2, '2 seconds')

    to_s_test_helper(2*60, '2 minutes')

    to_s_test_helper(2*60*60, '2 hours')

    to_s_test_helper(2*60*60*24, '2 days')

    to_s_test_helper(2*60*60*24*365, '2 years')
  end

  def test_to_s_ago
    to_s_ago_test_helper(1, '1 second ago')

    to_s_ago_test_helper(60, '1 minute ago')

    to_s_ago_test_helper(60*60, '1 hour ago')

    to_s_ago_test_helper(60*60*24, '1 day ago')

    to_s_ago_test_helper(60*60*24*365, '1 year ago')
  end

  def test_to_years
    timespan = SimpleTimespan.new(60*60*24*365 + 24*60*60 + 60*60 + 60 + 1)
    assert_equal(1, timespan.to_years)
  end

  def test_to_days
    timespan = SimpleTimespan.new(60*60*24*365 + 24*60*60 + 60*60 + 60 + 1)
    assert_equal(365 + 1, timespan.to_days)
  end

  def test_to_hours
    timespan = SimpleTimespan.new(60*60*24*365 + 24*60*60 + 60*60 + 60 + 1)
    assert_equal(((365 + 1) * 24) + 1, timespan.to_hours)
  end

  def test_to_minutes
    timespan = SimpleTimespan.new(60*60*24*365 + 24*60*60 + 60*60 + 60 + 1)
    assert_equal(((((365 + 1) * 24) + 1) * 60) + 1, timespan.to_minutes)
  end

  def test_to_seconds
    timespan = SimpleTimespan.new(60*60*24*365 + 24*60*60 + 60*60 + 60 + 1)
    assert_equal(((((((365 + 1) * 24) + 1) * 60) + 1) * 60) + 1, timespan.to_seconds)
  end

  private

  def to_s_test_helper(value, expected)
    to_s_helper(value, expected, &:to_s)
  end

  def to_s_ago_test_helper(value, expected)
    to_s_helper(value, expected, &:to_s_ago)
  end

  def to_s_helper(value, expected)
    raise ArgumentError unless block_given?

    timespan = SimpleTimespan.new(value)
    assert_equal(expected, yield(timespan))
  end
end
