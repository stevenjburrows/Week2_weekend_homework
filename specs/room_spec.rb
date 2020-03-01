require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new('Fear of the dark')
    @song2 = Song.new('Sound of silence')
    @song3 = Song.new('Thunderstruck')
    @song4 = Song.new('Space Oddity')
    @songs = [@song1, @song2, @song3]
    @guest1 = Guest.new('Ozzy Osbourne', 100)
    @guest2 = Guest.new('Bruce Dickenson', 200)
    @guest3 = Guest.new('Axel Rose', 150)
    @room1 = Room.new('The dreadnought', @songs, 2, 25)

  end

  def test_has_name
    assert_equal('The dreadnought', @room1.name)

  end

  def test_has_song
    assert_equal(3, @room1.songs.count)

  end

  def test_add_song
    @room1.add_song(@song4)
    assert_equal(4, @room1.songs.count)
  end

  def test_remove_song
    @room1.remove_song(@song1)
    assert_equal(2, @room1.songs.count)
  end

  def test_add_guest
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.guests.count)
  end

  def test_remove_guest
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest(@guest1)
    assert_equal(1, @room1.guests.count)
  end

  def test_refuse_entry
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    assert_equal(2, @room1.guests.count)
  end

  def test_remove_money_from_wallet
    @room1.add_guest(@guest1)
    @room1.remove_money(@guest1)
    #@guest1.remove_money(25)
    assert_equal(75, @guest1.wallet)
  end

  def test_add_to_room_and_remove_money
      @room1.enter_room(@guest2)

    assert_equal(175, @guest2.wallet)
  end

end
