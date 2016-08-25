class Car
  def initialize(make, year)
    @make = make
    @year = year
    @speed = 0
    @lights = false
    @parking_brake = 'on'
  end

  def make
    @make
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def accelerate
     @speed = @speed + 10
   end

  def brake
    if @speed < 7
    @speed = 0
  else
    @speed = @speed - 7
    end
  end

  def lights?
    @lights
  end

  def lights
    if @lights == false
      "off"
    else
      "on"
    end
  end

  def toggle_lights
    if @lights == false
      @lights = true
    else
      @lights = false
    end
  end

  def set_parking_brake
    @parking_brake 
  end

end
