class CarController < ApplicationController
  def create
    make = params[:make]
    year = params[:year]
    @car = Car.new(make, year)
    session[:car] = @car.to_yaml
    redirect_to '/car/simulate'
  end

  def simulate
    @car = YAML.load(session[:car])
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    redirect_to '/car/simulate'
  end

  def brake
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    redirect_to '/car/simulate'
  end

  def toggle_lights
    @car = YAML.load(session[:car])
    @car.toggle_lights
    session[:car] = @car.to_yaml
    redirect_to '/car/simulate'
  end

  def set_parking_brake
    @car = YAML.load(session[:car])
    @car.set_parking_brake
    session[:car] = @car.to_yaml
    redirect_to '/car/simulate'
  end

end
