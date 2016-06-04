# Car class. Attempt to mimic the controls of my Renault Megane. Features include an automatic handbrake (button), speed limit, and cruise control.

class Car

  def initialize
    @speed = 0
    @handbrake = 'on'
    @engine_on = 'no'
    @cruise = 'off'
    @cruise_speed = 0
  end

  def start
    @engine_on = 'yes'
    'Engine running'
  end

  def stop
    @engine_on = "no"
    @speed = 0
    @cruise_speed = 0
    handbrake
    'Engine stopped'
    "Handbrake is #{@handbrake}"
  end

  def handbrake  # handbrake toggle
    if @handbrake == 'on'
       @handbrake = 'off'
      "Handbrake is #{@handbrake}"
    else
      @handbrake = 'on'
      @speed = 0
      "Handbrake is #{@handbrake}"
    end
  end

  def accelerate(mph)
    return 'start car first' if @engine_on == 'no'
    if @handbrake == 'on'
      @handbrake = 'off'
      @speed += mph
      "speed is #{@speed} mph"
    else
      @speed += mph
      "speed is #{@speed} mph"
    end
  end

  def decelerate(mph)
    if (@speed - mph) > 0    # speed should not fall below 0
      @speed -= mph
      "speed is #{@speed} mph"
    else
      @speed = 0
      "speed is #{@speed} mph"
    end
  end

  def cruise_plus
    return "Cruise permitted at speeds greater than 15 mph" if @speed < 15
    if @cruise == 'off'
      @cruise = 'on'
      @cruise_speed = @speed # set cruise for first time
      "Cruise control on, speed #{@speed} mph"
    else # if already on...
      @cruise_speed += 1  # cruise speed setting
      @speed +=1  # actual speed
      "Cruise speed increased to #{@speed} mph"
    end
  end

  def cruise_minus
    return "cruise not enabled" if @cruise == 'off'
    if @cruise == 'on' && @cruise_speed >= 16
      @cruise_speed -= 1
      @speed -= 1
      "Cruise speed decreased to #{@speed} mph"
    elsif @cruise == 'on' && @cruise_speed == 15
      cruise_off
      "Cruise disabled at speeds less than 15 mph"
    else
      "Cruise is not enabled"
    end
  end

  def cruise_off
    @cruise = 'off'
    'Cruise disabled'
  end

  def cruise_resume
    if @cruise_speed > 0
      @cruise = 'on'
      @speed = @cruise_speed
      "Cruise resumed to #{@speed}"
    else
      'Cruise speed is not set'
    end
  end

end



# mycar = Car.new
# p mycar.start
# p mycar.stop
# mycar.accelerate(5)
# mycar.cruise_plus
# p mycar



# NOTE: speed doesn't decrease to zero automatically without cruise control on.

# Not implemented:

# IDEA: Speed limiter

# IDEA: cruise control OR speed limiter, cannot be both. Buttons must detect which is on when the plus, minus, off, and resume buttons are pressed.

# IDEA: speed_limit_set - might want to rename the method to 'plus' and 'minus', rather than specifically 'cruise_plus' and 'cruise_minus' so that the method can be used for both

# IDEA: If speed limit set, don't allow accelerate to function, unless the value is significantly large, to override, i.e. foot to the floor! then allow a smaller percentage of the accelerate value to be applied. Speed should drop back down to the limit set.

# IDEA: speed_limit_off - accelerate should function as normal.

# IDEA: speed limit value resets to nil when car turned off.
