require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new('Ozzy Osbourne')

  end

  def test_has_name
    assert_equal('Ozzy Osbourne', @guest1.name)

  end

end
