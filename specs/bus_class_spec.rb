require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_class')
require_relative('../person_class')
require_relative('../bus_stop_class')


class TestBus < Minitest::Test

  def setup
    @bus1 = Bus.new(43, "South Queensferry")
    @person1 = Person.new("Gareth", 32)
  end

  def test_can_drive
    assert_equal("Brum Brum", @bus1.drive)
  end

  def test_can_get_num_of_passengers
    assert_equal(0, @bus1.num_of_passenegrs)
  end

  def test_can_get_num_of_passengers__2
    @bus1.pick_up(@person1)
    @bus1.pick_up(@person1)
    assert_equal(2, @bus1.num_of_passenegrs)
  end

  def test_can_pick_up
    @bus1.pick_up(@person1)
    assert_equal(1, @bus1.num_of_passenegrs)
  end

  def test_can_drop_off
    @bus1.pick_up(@person1)
    @bus1.drop_off(@person1)
    assert_equal(0, @bus1.num_of_passenegrs)
  end

  def test_can_empty_bus
    @bus1.pick_up(@person1)
    @bus1.pick_up(@person1)
    @bus1.empty_bus()
    assert_equal(0, @bus1.num_of_passenegrs)
  end

  def test_pick_up_from_stop__1
    @stop1 = BusStop.new("CodeClan")
    @stop1.add_person_to_queue(@person1)
    @bus1.pick_up_from_stop(@stop1)
    assert_equal(1, @bus1.num_of_passenegrs)
    assert_equal(0, @stop1.queue_length)
  end
  def test_pick_up_from_stop__2
    @stop1 = BusStop.new("CodeClan")
    @stop1.add_person_to_queue(@person1)
    @stop1.add_person_to_queue(@person1)
    @bus1.pick_up_from_stop(@stop1)
    assert_equal(2, @bus1.num_of_passenegrs)
    assert_equal(0, @stop1.queue_length)
  end

end
