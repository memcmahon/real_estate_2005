class House
  attr_reader :address, :rooms, :price

  def initialize(price, address)
    @price = price.delete('$').to_i
    @address = address
    @rooms = []
    @zebra = "stripey beast"
  end

  # def price
  #   @price.delete('$').to_i
  # end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500_000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end

    # rooms = []
    # @rooms.each do |room|
    #   if room.category == category
    #     rooms << room
    #   end
    # end
    # rooms
  end

  def area
    # total = 0
    # @rooms.each do |room|
    #   total += room.area
    # end
    # total

    # @rooms.inject(0) do |total, room|
    #   total + room.area
    # end

    @rooms.sum do |room|
      room.area
    end

    # @rooms.sum(&:area)
  end
  #
  def details
    {
      "address" => @address,
      "price" => @price,
    }
  end

  def rooms_by_category
    rooms = {}
    @rooms.each do |room|
      rooms[room.category] = [] if rooms[room.category].nil?
      rooms[room.category] << room
    end
    rooms

    # ^^ This is how I would solve the problem, and I think it is important for you all to come to a point of understanding what is going on in this each loop because it will help solidify some concepts around working with Hashes.  That said, you *can* use the method `group_by` to accomplish the same thing.

    # One thing to note: for whatever reason, `group_by` is a method that students tend to get too attached to.  It solves ONE (1, UNO, EINS, 1️⃣) **VERY SPECIFIC** problem, but students tend to want to use it to solve ALL hash problems; if you reach for `group_by` anytime you are presented with a hash problem, you will soon tie yourself into a knot of nastiness that will be difficult to work with.  Much simpler to start with each and refactor to group_by if necessary.

    # @rooms.group_by do |room|
    #   room.category
    # end
  end
end
