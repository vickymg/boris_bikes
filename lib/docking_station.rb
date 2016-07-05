require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise "Docking station full!" if full?
    @bikes << bike
  end

  def release_bike
    raise 'No bikes available at this station!' if empty?
    for i in 0...@bikes.length do
      return @bikes.shift if !@bikes[i].broken?
    end
    raise 'Sorry, this bike is broken!'
  end

  def release_broken_bikes
    raise 'No broken bikes to collect!' if !any_broken?
    for i in 0...@bikes.length do
      return @bikes.shift if @bikes[i].broken?
    end
  end

  def receive_fixed_bikes(van)
    raise "Docking station full!" if full?
    @bikes << van.deliver_working_bikes
  end

  private

  def full?
    @bikes.length >= @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

  def any_broken?
    @bikes.any? { |bike| bike.broken? }
  end
end
