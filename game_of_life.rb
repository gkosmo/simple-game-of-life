class GameOfLife
  attr_reader :current_state

  def initialize(initial_state)
    @current_state = initial_state
  end

  def neighbour_cells_alive(cell)
    cell.neighbours & @current_state
  end

  def cell_alive?(cell)
    [2, 3].include? neighbour_cells_alive(cell).size
  end

  def respawn_dead_cell?(cell)
    neighbour_cells_alive(cell).size == 3
  end

  def next_state
    @next_state = []
    @current_state.each do |cell|
      @next_state << cell if cell_alive?(cell)
      (cell.neighbours - @next_state).each do |dead_cell|
        @next_state << dead_cell if respawn_dead_cell?(dead_cell)
      end
    end
    @current_state = @next_state.uniq
  end
end
