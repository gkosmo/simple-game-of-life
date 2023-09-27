class GolCell
  attr_reader :y, :x

  def initialize(x, y)
    @x, @y = x, y
  end

  def neighbours
    neighbours = []
    neighbours << GolCell.new(@x + 1, @y - 1)
    neighbours << GolCell.new(@x + 1, @y)
    neighbours << GolCell.new(@x + 1, @y + 1)

    neighbours << GolCell.new(@x - 1, @y - 1)
    neighbours << GolCell.new(@x - 1, @y)
    neighbours << GolCell.new(@x - 1, @y + 1)

    neighbours << GolCell.new(@x, @y - 1)
    neighbours << GolCell.new(@x, @y + 1)

    neighbours
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    [@x, @y].hash
  end
end
