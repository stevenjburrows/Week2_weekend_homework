require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class TestFood < Minitest::Test

  def setup
    @food1 = Food.new('Cherry bomb', 5)

  end

  def test_has_name
    assert_equal('Cherry bomb', @food1.name)
  end

  def test_price
    assert_equal(5, @food1.price)
  end
end
