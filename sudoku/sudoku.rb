class Sudoku
  def initialize(board)
    @board = set(board)
  end

  def solve!
    board_copy = nil

    until solved? || stuck?(board_copy)
      board_copy = board.dup

      spaces.each_with_index do |space, index|
        if unsolved?(space)
          board[index] = case
                         when one_possibility?(index)             then only_possibility(index)
                         when unique_possibility_in_row?(index)   then unique_possibility_in_row(index)
                         when unique_possibility_in_col?(index)   then unique_possibility_in_col(index)
                         when unique_possibility_in_block?(index) then unique_possibility_in_block(index)
                         else "-"
                         end

          sleep(0.005)
          display_board
        end
      end
    end

    return true if solved?

    guess

    false
  end

  private

  attr_accessor :board

  POSSIBLE_VALUES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def guess
    save_board_state

    unsolved_indexes_and_possibilities = get_unsolved_indexes_and_possibilities

    unsolved_indexes = unsolved_indexes_and_possibilities.keys.sort_by { |index| unsolved_indexes_and_possibilities[index].size }

    unsolved_indexes.each do |board_index|
      unsolved_indexes_and_possibilities[board_index].each do |possibility|
        board[board_index] = possibility

        if broken_board?
          reset_board
          next
        end

        # display_guess(index, possibility)
        solve!

        return true if solved?
        reset_board
      end
    end
    discard_last_saved_board_state
  end

  def guess_stack
    @guess_stack ||= []
  end

  def save_board_state
    guess_stack << board.dup
  end

  def discard_last_saved_board_state
    guess_stack.pop
  end

  def get_unsolved_indexes_and_possibilities
    spaces.each_with_object(Hash.new).with_index do |(space, unsolved_indexes_and_possibilities), index|
      unsolved_indexes_and_possibilities[index] = find_possible(index) if unsolved?(space)
    end
  end

  def broken_board?
    (0..81).any? { |index| unsolved?(board[index]) && find_possible(index).empty? }
  end

  def reset_board
    self.board = guess_stack.last.dup
  end

  def spaces
    board.chars
  end

  def solved?
    !(board =~ /-/)
  end

  def stuck?(board_copy)
    board_copy == board
  end

  def unsolved?(char)
    char == "-"
  end

  def unsolved_values
    lambda { |value| value == "-" }
  end

  def one_possibility?(index)
    find_possible(index).size == 1
  end

  def only_possibility(index)
    find_possible(index).first
  end

  def find_possible(board_index)
    possible_values  = POSSIBLE_VALUES
    possible_values -= values_in_row(board_index)
    possible_values -= values_in_column(board_index)
    possible_values -= values_in_block(board_index)
  end

  def rows
    board.chars.each_slice(9).to_a
  end

  def row_index(board_index)
    board_index / 9
  end

  def values_in_row(board_index)
    rows[row_index(board_index)].reject(&unsolved_values)
  end

  def columns
    rows.transpose
  end

  def col_index(board_index)
    board_index % 9
  end

  def values_in_column(board_index)
    columns[col_index(board_index)].reject(&unsolved_values)
  end

  def block(board_index)
    rows_range = block_rows_range(board_index)
    cols_range = block_cols_range(board_index)

    rows[rows_range].map { |row| row[cols_range] }
  end

  def block_rows_range(board_index)
    case row_index(board_index)
    when (0..2) then (0..2)
    when (3..5) then (3..5)
    else (6..9)
    end
  end

  def block_cols_range(board_index)
    case col_index(board_index)
    when (0..2) then (0..2)
    when (3..5) then (3..5)
    else (6..9)
    end
  end

  def values_in_block(board_index)
    block(board_index).flatten.reject(&unsolved_values)
  end

  def unique_possibility_in_row?(index)
    possible_values = find_possible(index) - row_mate_possibilities(index)
    possible_values.size == 1
  end

  def unique_possibility_in_row(index)
    possible_values = find_possible(index) - row_mate_possibilities(index)
    possible_values.first
  end

  def row_mate_possibilities(index)
    unsolved_row_mates(index).map(&possibilities).flatten.uniq
  end

  def unsolved_row_mates(index)
    (0..80).select { |i| row_index(i) == row_index(index) && i != index && unsolved?(board[i]) }
  end

  def unique_possibility_in_col?(index)
    possible_values = find_possible(index) - col_mate_possibilities(index)
    possible_values.size == 1
  end

  def unique_possibility_in_col(index)
    possible_values = find_possible(index) - col_mate_possibilities(index)
    possible_values.first
  end

  def col_mate_possibilities(index)
    unsolved_col_mates(index).map(&possibilities).flatten.uniq
  end

  def unsolved_col_mates(index)
    (0..80).select { |i| col_index(i) == col_index(index) && i != index && unsolved?(board[i])}
  end

  def unique_possibility_in_block?(index)
    possible_values = find_possible(index) - block_mate_possibilities(index)
    possible_values.size == 1
  end

  def unique_possibility_in_block(index)
    possible_values = find_possible(index) - block_mate_possibilities(index)
    possible_values.first
  end

  def block_mate_possibilities(index)
    unsolved_block_mates(index).map(&possibilities).flatten.uniq
  end

  def unsolved_block_mates(index)
    (0..80).select { |i| block_rows_range(i) == block_rows_range(index) && block_cols_range(i) == block_cols_range(index) && i != index && unsolved?(board[i])}
  end

  def possibilities
    lambda { |i| find_possible(i) }
  end

  def set(board)
    board.gsub(/[^1-9]/, '-')
  end

  def display_board
    reset_screen
    rows.each { |row| puts row.join(" ") }
  end

  def display_guess(index, possibility)
    display_board
    puts "\nGuessing #{possibility} at index #{index}."
    # sleep(2.0)
  end

  def reset_screen
    print "\e[2J"
    print "\e[H"
  end
end




# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
(0..14).to_a.each do |line|
  board = File.readlines('sample.unsolved.txt')[line].chomp

  game = Sudoku.new(board)

  game.solve!

  puts "\nPuzzle #{line + 1}"
  sleep(0.5)
end
