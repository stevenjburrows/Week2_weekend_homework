class Room

  attr_reader:name, :songs, :capacity, :guests, :cost, :till, :food, :drink

  def initialize(name, songs, capacity, cost, food, drink, till = 100, guests = [])

    @name = name
    @songs = songs
    @capacity = capacity
    @cost = cost
    @food = food
    @drink = drink
    @guests = guests
    @till = till

  end

  def add_song(song)
    @songs << song


  end

  def remove_song(song)
    @songs.delete(song)

  end

  def add_guest(guest)
    @guests << guest if @guests.count < @capacity


  end

  def remove_guest(guest)
    @guests.delete(guest)

  end

  def remove_money(guest_name)
  #   #for a selected guest reduce their wallet
  #   #by a selected amount
  #
  #
  guest_name.remove_money(@cost)
  end

  def enter_room(guest)
    add_guest(guest)
    remove_money(guest)

  end

  def is_favourite_song_playing(guest_name)
    return "rock and roll ain't noise pollution " if @songs.any? { |song| song.name == guest_name.favourite_song  }
    return "I Can't Get No Satisfaction"
  end

  def add_money_to_till
    @till += @cost
  end

  def enter_room_with_till(guest)
    add_guest(guest)
    remove_money(guest)
    add_money_to_till

  end

  def pay_for_drink(guest, drink)
    guest.remove_money(drink.price)
    @till += drink.price

  end

  def pay_for_food(guest, food)
    guest.remove_money(food.price)
    @till += food.price

  end

end
