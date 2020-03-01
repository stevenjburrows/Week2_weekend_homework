require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestDrink < Minitest::Test

  def setup
    @drink1 = Drink.new('Whiskey on the water', 5)

  end

  def test_has_name
    assert_equal('Whiskey on the water', @drink1.name)
  end

  def test_price
    assert_equal(5, @drink1.price)
  end

end
