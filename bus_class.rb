class Bus
  def initialize(route_num, destination)
    @route_num = route_num
    @destination = destination
    @passengers = []
  end

  def drive
    return  "Brum Brum"
  end

  def num_of_passenegrs
    return @passengers.count()
  end

  def pick_up(passenger)
    @passengers.push(passenger)
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus
    @passengers = []
  end

  def pick_up_from_stop(stop)
    pick_up(stop.get_queue()).flatten!
    stop.empty_queue
  end


end
