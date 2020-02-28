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
    @songs = [@song1, @song2, @song3]
    @guest1 = Guest.new('Ozzy Osbourne')
    @guest2 = Guest.new('Bruce Dickenson')
    @room1 = Room.new('The dreadnought', @songs)

  end

  def test_has_name
    assert_equal('The dreadnought', @room1.name)

  end

  def test_has_song
    assert_equal(3, @room1.songs.count)

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


end
