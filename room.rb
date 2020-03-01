class Room

  attr_reader:name, :songs, :capacity, :guests, :cost

  def initialize(name, songs, capacity, cost, guests = [])

    @name = name
    @songs = songs
    @capacity = capacity
    @cost = cost
    @guests = guests

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
    return 'Rock on' if @songs.any? { |song| song.name == guest_name.favourite_song  }
    return "I Can't Get No Satisfaction"
  end



end
