require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../person_class')

class TestPerson < Minitest::Test

  def setup
    @person1 = Person.new("Gareth", 32)
    @person2 = Person.new("Luke", 28)
  end


def test_get_name
  assert_equal("Gareth", @person1.name)
end

def test_get_age
  assert_equal(28, @person2.age)
end

end
