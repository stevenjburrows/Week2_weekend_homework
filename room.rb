class Room

  attr_reader:name, :songs, :capacity, :guests

  def initialize(name, songs, capacity, guests = [])

    @name = name
    @songs = songs
    @capacity = capacity
    @guests = guests

  end

  def add_guest(guest)
    @guests << guest

  end

  def remove_guest(guest)
    p @guests
    @guests.delete(guest)
    p @guests

  end

end
