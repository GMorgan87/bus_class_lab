require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_class')
require_relative('../person_class')
require_relative('../bus_stop_class')

class TestBusStop < Minitest::Test

def setup
  @stop1 = BusStop.new("CodeClan")
  @person = Person.new("Luke", 28)
end

def test_get_queue_length
  assert_equal(0, @stop1.queue_length())
end

  def test_add_person_to_queue
    @stop1.add_person_to_queue(@person)
    assert_equal(1, @stop1.queue_length())
  end

  def test_empty_queue
    @stop1.add_person_to_queue(@person)
    @stop1.empty_queue
    assert_equal(0, @stop1.queue_length())
  end

  def test_get_queue
    @stop1.add_person_to_queue(@person)
    passengers_to_move = @stop1.get_queue
    assert_equal(1, passengers_to_move.length())
  end

end
