require_relative 'bike'

class DockingStation

  MAXIMUM_CAPACITY = 20

  def initialize
    @bikes = []
    
  end

  attr_reader :bikes

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking Station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= MAXIMUM_CAPACITY
  end

  def empty?
    @bikes.empty?
  end


end
