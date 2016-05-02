class Utils
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24
  MINUTES_PER_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY
  def self.fahrenheit_to_celsius(degrees)
    (degrees - 32) / (9 / 5.0)
  end
end