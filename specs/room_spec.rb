require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')
require_relative('../food')
require_relative('../drink')

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new('Fear of the dark')
    @song2 = Song.new('Sound of silence')
    @song3 = Song.new('Thunderstruck')
    @song4 = Song.new('Space Oddity')
    @songs = [@song1, @song2, @song3]
    @food1 = Food.new('Cherry bomb', 5)
    @food2 = Food.new('Pour Some Sugar On Me', 10)
    @drink1 = Drink.new('Whiskey on the water', 5)
    @drink2 = Drink.new("Beer Drinkers & Hellraisers", 8)
    @food = [@food1, @food2]
    @drink = [@drink1, @drink2]
    @guest1 = Guest.new('Ozzy Osbourne', 100, 'Paranoid')
    @guest2 = Guest.new('Bruce Dickenson', 200, 'Fear of the dark')
    @guest3 = Guest.new('Axel Rose', 150, 'Welcome to the jungle')
    @room1 = Room.new('The dreadnought', @songs, 2, 25, @food, @drink)

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

  def test_if_favourite_song_is_playing
    @room1.add_guest(@guest2)
    assert_equal("rock and roll ain't noise pollution ", @room1.is_favourite_song_playing(@guest2))
  end

  def test_if_favourite_song_isnt_playing
    @room1.add_guest(@guest1)
    #@room1.is_favourite_song_playing
    assert_equal("I Can't Get No Satisfaction", @room1.is_favourite_song_playing(@guest1))
  end

  def test_has_money_in_till
    assert_equal(100, @room1.till)

  end

  def test_add_money_to_till
    @room1.add_money_to_till
    assert_equal(125, @room1.till)

  end
  def test_add_to_room_and_remove_money_add_to_till
    @room1.enter_room_with_till(@guest2)
    assert_equal(175, @guest2.wallet)
    assert_equal(125, @room1.till)
  end
  def test_add_2_to_room_and_remove_money_add_to_till
    @room1.enter_room_with_till(@guest2)
    @room1.enter_room_with_till(@guest1)
    assert_equal(175, @guest2.wallet)
    assert_equal(75, @guest1.wallet)
    assert_equal(150, @room1.till)
  end

  def test_has_food
    assert_equal(2, @room1.food.count)
  end

  def test_has_drink
    assert_equal(2, @room1.drink.count)
  end

  def test_pay_for_drink
    @room1.pay_for_drink(@guest1, @drink1)
    assert_equal(95, @guest1.wallet)
    assert_equal(105, @room1.till)

  end

  def test_pay_for_food
    @room1.pay_for_food(@guest2, @food1)
    assert_equal(195, @guest2.wallet)
    assert_equal(105, @room1.till)

  end

  def test_add_guests_buying_food_and_drink
    @room1.enter_room_with_till(@guest1)
    @room1.enter_room_with_till(@guest2)
    @room1.pay_for_drink(@guest1, @drink1)
    @room1.pay_for_drink(@guest2, @drink2)
    @room1.pay_for_food(@guest2, @food1)
    @room1.pay_for_food(@guest1, @food2)

    assert_equal(2, @room1.guests.count)
    assert_equal("rock and roll ain't noise pollution ", @room1.is_favourite_song_playing(@guest2))
    assert_equal("I Can't Get No Satisfaction", @room1.is_favourite_song_playing(@guest1))
    assert_equal(162, @guest2.wallet)
    assert_equal(60, @guest1.wallet)
    assert_equal(178, @room1.till)


  end

end
