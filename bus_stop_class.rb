class BusStop

  def initialize(name)
    @name = name
    @queue = []
  end

  def queue_length
    @queue.length()
  end

  def add_person_to_queue(passenger)
    @queue.push(passenger)
  end

  def empty_queue
    @queue = []
  end

  def get_queue
    return @queue
  end

end
