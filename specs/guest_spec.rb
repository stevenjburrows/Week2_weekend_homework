require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new('Ozzy Osbourne', 100, 'Paranoid')

  end

  def test_has_name
    assert_equal('Ozzy Osbourne', @guest1.name)

  end

  def test_has_money
    assert_equal(100, @guest1.wallet)

  end

  def test_remove_money_from_wallet
    @guest1.remove_money(25)
    assert_equal(75, @guest1.wallet)

  end

  def test_favourite_song
    assert_equal('Paranoid', @guest1.favourite_song)

  end

end
