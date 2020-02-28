require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new('Fear of the dark')
  end

  def test_has_name
    assert_equal('Fear of the dark', @song1.name)

  end

end
